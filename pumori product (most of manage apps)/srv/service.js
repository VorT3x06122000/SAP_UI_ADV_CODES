//-----------------------------------------------------------------------------------*
//Confidential and Proprietary
//Copyright HP
//All Rights Reserved
//-----------------------------------------------------------------------------------*
// Application Name :    Manage Pumori PS Product Master
// WRICEF No        : 
// Release          :    
// Author           :    
// Date             :    
// Description      :    Manage Pumori PS Product Master 
//-----------------------------------------------------------------------------------*
//Descriptions: Holds logic for services
//-----------------------------------------------------------------------------------*
//Change Log:
//  Date       	|	Author           			|   Defect/Incident           			|	Change Description

//-----------------------------------------------------------------------------------*/


const cds = require('@sap/cds');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const axios = require('axios').default;
const { jwtDecode } = require('jwt-decode');
const { Worker } = require('worker_threads');
const { ERROR_STATUS_CODE, ACCEPT_STATUS_CODE, CONSTPROPS, BATCH_SIZE } = require('./constants');
const { _convertInputForProcedure, _callHdbProcedure } = require('./commonhelper');
const { handleAsyncJob } = require('./pumoriproduct/pumoriproduct-helper');
const { handleAsyncJobLocMasterUpload } = require('./pumoriprodloc/pumoriprodloc-helper');
const { handleAsyncJobTranslane } = require('./pumoritlane/pumoritlane-helper');
const { handleAsyncJobUOM } = require('./pumoriuom/pumoriuom-helper');
const { mappingFtFv, manageflag, PumoriProducts } = cds.entities('pumorips.pumoriproduct');

module.exports = cds.service.impl(async function () {
    let securityScope = {
        "WithCost": false,
        "WithoutCost": false,
        "WithCostview": false,
        "WithoutCostview": false
    };

    this.on('UPDATE', "mappingFtFv", async (req) => {
        try {

            const tx = cds.transaction(req);
            const authToken =  req.headers.authorization;
            const decoded = jwtDecode(authToken); 
            // const decoded = "v.girish.pahurkar@acc.com"; 
             
               await tx.run(UPDATE.entity(mappingFtFv).set(
                {
                    // zhfvtypeHP: req.data.zhfvtypeHP,
                    zhfvvalueHP: req.data.zhfvvalueHP,
                    modifiedBy: decoded.email
                }
            ).where({
                factoryNumber: req.data.factoryNumber,
                zhfvtypeFac: req.data.zhfvtypeFac,
                zhfvvalueFac: req.data.zhfvvalueFac
            }));

            
        } catch (error) {
            return req.error(error.message);
        }

    });

    this.on('CREATE', "manageflag", async (req) => {
        try {
            const authToken = req.headers.authorization;
            const decoded = jwtDecode(authToken);
            await _callHdbProcedure("manageflagInsert", { "ZHFVTYPE": req.data.zhfvType, "USEREMAIL": decoded.email });
            return { zhfvType: req.data.zhfvType };
        } catch (error) {
            return req.error(error.message);
        }
    });

    /*********************** Security Check Module************************************/
    this.on("SecurityAction", async (req) => {
        var requestAuthInfo = req.req.authInfo;

        securityScope.WithCost = requestAuthInfo.checkLocalScope('WithCost');
        securityScope.WithoutCost = requestAuthInfo.checkLocalScope('WithoutCost');
        securityScope.WithCostview = requestAuthInfo.checkLocalScope('WithCostview');
        securityScope.WithoutCostview = requestAuthInfo.checkLocalScope('WithoutCostview');
        return JSON.stringify(securityScope);
    });


    /************************Background Job Pumori Product Master*******************************/
    this.on('PumoriProductsMasterUpload', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            // afterwards the actual processing
            let finalResult = await handleAsyncJob(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
        }
    });

    /************************Background Job Pumori Product Location Master*******************************/
    this.on('PumoriProdLocMasterUpload', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            let finalResult = handleAsyncJobLocMasterUpload(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
        }
    });

    /************************Background Job Pumori Product UOM*******************************/
    this.on('PumoriUOMMasterUpload', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            let finalResult = handleAsyncJobUOM(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
        }
    });

    /************************Background Job Pumori Product TLane*******************************/
    this.on('PumoriTranslaneMasterUpload', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            let finalResult = handleAsyncJobTranslane(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
        }
    });

    /************************Update Pumori Product method*******************************/
    this.on('UpdatePumoriProd', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aProdPayload = JSON.parse(oData.ProdData);
            const tx = cds.transaction(req);

            //Product table update- single item
            let resProduct = await tx.run(UPDATE.entity(PumoriProducts).
                data({
                    zhfvType: aProdPayload.zhfvType,
                    zhfvValue: aProdPayload.zhfvValue,
                    strategicautoFlag: aProdPayload.strategicautoFlag,
                    modifiedBy: oData.UserEmail,
                    keeperFlag: 'X'
                }).where({ prodId: aProdPayload.prodId })).catch((error) => {
                    msgLog.push({ "type": "Error", "message": error.message });
                });
            if (resProduct && resProduct > 0) {
                msgLog.push({ "type": "Success", "message": bundle.getText("ProductUpdated") });
            }

            return JSON.stringify(msgLog);
        }
        catch (error) {
            console.log(error);
        }
    });

    /************************Update Pumori Product method*******************************/
    this.on('UpdateFlagDetail', async (req) => {
        try {
            msgLog = [];
            let oData = req.data;
            let aProdPayload = JSON.parse(oData.FlagUpdateData);
            let aUpdateItems = [];
            let nUpdated = 0;
            let aProdId = [];
            let aBTPProdId = [];
            let nBTPProdIdCount = 0;
            for (let i of aProdPayload) {
                let sProdid = i.prodId;
                if (!sProdid.startsWith(CONSTPROPS.BtpGeneratedHPPN)) {
                    aProdId.push(i);
                }
                if (sProdid.startsWith(CONSTPROPS.BtpGeneratedHPPN)) {
                    aBTPProdId.push(i);
                }
            }
            //Product table update- multiple items
            for (let item of aProdId) {
                aUpdateItems.push(UPDATE(PumoriProducts).set({
                    zConstrain: item.zConstrain,
                    zStrategic: item.zStrategic,
                    modifiedBy: oData.UserEmail,
                    keeperFlag: 'X'
                }).where({ prodId: item.prodId }));
            }


            let nChunkSize = 1000;
            let nBatchSize = BATCH_SIZE;
            let nBatches = Math.ceil(aUpdateItems.length / nBatchSize);
            while (nBatches--) {
                let aNewUpdateItems = aUpdateItems.splice(0, nBatchSize);
                let aUpdatePromise = [];
                let cube = [];
                while (aNewUpdateItems.length != 0) {
                    const resArrayNew = aNewUpdateItems.splice(0, nChunkSize);
                    cube = resArrayNew;
                    const worker1 = new Worker(__dirname + "/worker.js");
                    worker1.postMessage(cube);
                    let nUpdatedCount = 0
                    aUpdatePromise.push(
                        new Promise((resolve, reject) => {
                            worker1.on("message", async result => {
                                let res1 = await _processUpdateChunk(result, req);
                                nUpdatedCount = res1 === 0 ? nUpdatedCount : nUpdatedCount + res1.length;
                                worker1.terminate();
                                resolve(nUpdatedCount);
                            });
                            worker1.on("error", () => {
                                reject();
                            });
                            worker1.on("exit", async () => {
                            })
                        })
                    );
                }
                let nUpdatedNew = await Promise.all(aUpdatePromise).then(async function (results) {
                    let nUpdatedItems = (results.length === 0) ? 0 : Math.max.apply(Math, results);
                    return nUpdatedItems;
                }).catch((error) => {
                    return 0;
                });
                nUpdated = nUpdated + nUpdatedNew;
            }

            try {
                updateAutoFlag([]);
            }
            catch (error) {
                console.log(error.message);
            }

            if (aProdPayload.length == aBTPProdId.length) {
                return bundle.getText('Updated1');
            } else if (aBTPProdId.length > 0 && aProdPayload.length !== aBTPProdId.length) {
                nBTPProdIdCount = aBTPProdId.length;
                return nUpdated + " " + bundle.getText('Updated2') + nBTPProdIdCount + " " + bundle.getText('Updated3');
            } else if (aBTPProdId.length == 0) {
                return nUpdated + " " + bundle.getText('Updated2');
            }
        }
        catch (error) {
            console.log(error);
        }
    });

    /*********************** Process Update Chunk Method ***********************/
    async function _processUpdateChunk(updatesubArray, req) {
        try {
            const tx = cds.transaction(req);
            let result = await cds.run(updatesubArray).catch((error) => req.error({ code: ERROR_STATUS_CODE, message: error.message }))
            return result;
        }
        catch (error) {
            return 0;
        }
    };

    /******************** method for calling M2 display auto flagging API *************************/
    async function updateAutoFlag(aProdId) {
        return new Promise((resolve, reject) => {
            return fetchJwtToken(DISP_CLIENTID, DISP_SECRET)
                .then((jwtToken) => {
                    axios
                        .post(DISP_URL, { 'pumoriProdData': aProdId }, {
                            headers: { Authorization: `Bearer ${jwtToken}` }
                        })
                        .then(res => {
                            resolve(res.data);
                        }).catch(error => reject({ error: error.message }))
                })
                .catch((error) => {
                    reject({ error: error.message })
                })
        })
    };

    this.on('PumoriStrategic', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.PostingData;
            let userEmail = oData.UserEmail;
            const tx = cds.transaction(req);
            let aUpdateItems = [];
            for (let item of aPayload) {
                // Strategicautoflag value
                const StrategicautoflagValue = (item.strategicautoFlag || item.strategicautoFlag == 'X' || item.strategicautoFlag == 'x') ? item.strategicautoFlag : null;
                let prodId = item.prodId;
                if (!prodId) {
                    throw Error(bundle.getText('Please Provide ProdId'));
                }
                // pushing update query in array
                aUpdateItems.push(
                    UPDATE.entity(PumoriProducts).
                        data({
                            strategicautoFlag: StrategicautoflagValue,
                            response: item.response || null,
                            modifiedBy: userEmail
                        }).where({ prodId: prodId }));
            }
            try {
                await tx.run(aUpdateItems);
                msgLog.push({ "type": "Success", "message": bundle.getText("Update Done Successfully") });
                return JSON.stringify(msgLog);
            } catch (err) {
                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
            }

        }
        catch (error) {
            console.log(error);
            return req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /*********************** manage flag without procedure ***********************/
    this.on('ManageFlag', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.PostingData;
            const userEmail = oData.UserEmail;
            const tx = cds.transaction(req);
            let aUpdateItems = [];
            let bUpdateItems = [];
            for (let item of aPayload) {
                // Strategicautoflag value
                const StrategicautoflagValue = (item.Strategicautoflag || item.Strategicautoflag == 'X' || item.Strategicautoflag == 'x') ? item.Strategicautoflag : '';

                // pushing update query in array
                aUpdateItems.push(
                    UPDATE.entity(manageflag).
                        data({
                            Strategicautoflag: StrategicautoflagValue,
                            response: item.response || null,
                            modifiedBy: userEmail
                        }).where({ zhfvType: item.zhfvType }));

                // after update for manageflag table update for pumori products base table
                bUpdateItems.push(
                    UPDATE.entity(PumoriProducts).
                        data({
                            strategicautoFlag: StrategicautoflagValue,
                            response: item.response,
                            modifiedBy: userEmail
                        }).where({ zhfvType: item.zhfvType }));
            }
            try {
                await tx.run(aUpdateItems);
                await tx.run(bUpdateItems);
                tx.commit;
                msgLog.push({ "type": "Success", "message": bundle.getText("Update Done Successfully") });
                return JSON.stringify(msgLog);
            } catch (err) {
                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
            }
        }
        catch (error) {
            console.log(error);
        }
    });



    /*********************** Pumori Product response click ***********************/
    this.on('PumoriProdResponse', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.PostingData;
            const userEmail = oData.UserEmail;
            const tx = cds.transaction(req);
            let aUpdateItems = [];
            for (let item of aPayload) {
                // pushing update query in array
                aUpdateItems.push(
                    UPDATE.entity(PumoriProducts).
                        data({
                            response: item.response,
                            modifiedBy: userEmail
                        }).where({ prodId: item.prodId }));
            }
            try {
                await tx.run(aUpdateItems);
                tx.commit;
                msgLog.push({ "type": "Success", "message": bundle.getText("Update Done Successfully") });
                return JSON.stringify(msgLog);
            } catch (err) {
                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
            }
        }
        catch (error) {
            console.log(error);
        }
    });

    this.on('flushAndFillProd', async (req) => {
        try {
            let msgLog = [];
            let res;
            let oData = req.data;
            let output = {};
            let aPayload = oData.PostingData;
            let sOperation = oData.Operation;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            if (sOperation == "Flush") {
                output = await _callHdbProcedure("pumoriProductFlush", { "DELTA_INPUT": aInputToProcedure });
            }
            if (sOperation == "Fill") {
                output = await _callHdbProcedure("pumoriProductFill", { "DELTA_INPUT": aInputToProcedure, "USEREMAIL": userEmail });
            }

            msgLog.push({ "type": "Success", "message": bundle.getText("UpdateSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });

    this.on('flushAndFillLoc', async (req) => {
        try {
            let msgLog = [];
            let res;
            let oData = req.data;
            let output = {};
            let aPayload = oData.PostingData;
            let sOperation = oData.Operation;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            if (sOperation == "FlushLoc") {
                output = await _callHdbProcedure("pumoriLocationFlush", { "DELTA_INPUT": aInputToProcedure });
            }
            if (sOperation == "FillLoc") {
                output = await _callHdbProcedure("pumoriLocationFill", { "DELTA_INPUT": aInputToProcedure, "USEREMAIL": userEmail });
            }

            msgLog.push({ "type": "Success", "message": bundle.getText("UpdateSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });

    this.on('ftfvload', async (req) => {
        try {
            let msgLog = [];
            let res;
            let oData = req.data;
            let output = {};
            // let aPayload = oData.PostingData;
            // let aInputToProcedure = _convertInputForProcedure(aPayload);
            output = await _callHdbProcedure("FeatureTypeandValueLoad", {});
            msgLog.push({ "type": "Success", "message": bundle.getText("UpdateSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });

    //Detailed screen FT FV mapping in Pumori product app
    this.on('UpdatePumoriProdftfv', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            const userEmail = oData.UserEmail;
            let aPayload = JSON.parse(oData.ProdData);
            const tx = cds.transaction(req);
            const manageFlagData = await tx.run(SELECT.from(manageflag).where({ zhfvType: aPayload.zhfvType })).catch((error) => req.error({ code: 400, message: error.message }));
            let resProduct = await tx.run(UPDATE.entity(PumoriProducts).
                data({
                    zhfvType: aPayload.zhfvType,
                    zhfvValue: aPayload.zhfvValue,
                    strategicautoFlag: manageFlagData[0].Strategicautoflag,
                    keeperFlag: aPayload.keeperFlag,
                    modifiedBy: userEmail
                }).where({ prodId: aPayload.prodId })).catch((error) => {
                    msgLog.push({ "type": "Error", "message": error.message });
                });

            if (resProduct && resProduct > 0) {
                msgLog.push({ "type": "Success", "message": bundle.getText('UpdateSuccess') });
            }
            return JSON.stringify(msgLog);
        }
        catch (error) {
            console.log(error);
        }
    });

    this.on('HistoryTableLoad', async (req) => {
        try {
            let msgLog = [];
            let res;
            let oData = req.data;
            let output = {};
            output = await _callHdbProcedure("historyTableDataLoad", {});
            msgLog.push({ "type": "Success", "message": bundle.getText("UpdateSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });


    this.on("UpdateHpFtResponse", async(req)=>{
        try{
            const tx = cds.transaction(req);
            const authToken =  req.headers.authorization;
            const decoded = jwtDecode(authToken);
            // const decoded = "v.girish.pahurkar@acc.com";
            const result = await tx.run(UPDATE.entity(mappingFtFv).set(
                {
                    zhfvtypeHP: req.data.PostingData[0].zhfvtypeHP,
                    modifiedBy: decoded
                }
            ).where({
                factoryNumber: req.data.PostingData[0].factoryNumber,
                zhfvtypeFac: req.data.PostingData[0].zhfvtypeFac
            }));

            const manageFlagData = await tx.run(SELECT.from(manageflag).where({ zhfvType: req.data.PostingData[0].zhfvtypeHP })).catch((error) => req.error({ code: 400, message: error.message }));
            if(manageFlagData.length > 0 ) {
                await tx.run(UPDATE.entity(PumoriProducts).
                data({
                    strategicautoFlag: manageFlagData[0].Strategicautoflag,
                    zhfvType: req.data.PostingData[0].zhfvtypeHP,
                    zhfvValue: req.data.PostingData[0].zhfvvalueHP,
                    modifiedBy: decoded
                }).where({ zhfvType: req.data.zhfvtypeFac }));
            }

            if (result && result.length > 0) {
                return 'Successfully Updated';
            } else {
                return 'No record found with the specified Factory Number and Factory FT Value';
            }
        }
        catch(error){
            return req.error(error.message);
        }
    });
 
});