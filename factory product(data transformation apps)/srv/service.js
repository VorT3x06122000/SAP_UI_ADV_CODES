const cds = require('@sap/cds');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const { BaseUOM, EDIConversion, UOMConversion, syn_FactoryStatusDashboard, BTPCompSequence } = cds.entities('pumorips.factoryproduct');
const { _convertInputForProcedure, _callHdbProcedure, _getBulkUploadResponse, _downloadTemplate, _convertCsvToJSON, _isValidRecords } = require('./validation');
const { ERROR_STATUS_CODE, CONSTCRUD, ACCEPT_STATUS_CODE, TEMPLATE_LIST, TEMPLATE_INFO } = require('./constants');
const { handleAsyncJob } = require('./helper');

module.exports = cds.service.impl(async function () {
    let securityScope = {
        "WithCost": false,
        "WithoutCost": false,
        "WithCostview": false,
        "WithoutCostview": false
    };

    /*********************** Security Check Module************************************/
    this.on("SecurityAction", async (req) => {
        var requestAuthInfo = req.req.authInfo;


        securityScope.WithCost = requestAuthInfo.checkLocalScope('WithCost');
        securityScope.WithoutCost = requestAuthInfo.checkLocalScope('WithoutCost');
        securityScope.WithCostview = requestAuthInfo.checkLocalScope('WithCostview');
        securityScope.WithoutCostview = requestAuthInfo.checkLocalScope('WithoutCostview');

        return JSON.stringify(securityScope);
    });


    /*********************** Factory Product Master Upload ***********************/
    this.on('FactoryProductsMasterUpload', async (req) => {
        let interface = "FactoryProducts";
        // Record start time
        let startTime = new Date();
        // Formating the date as YYYY-MM-DD
        const formattedDate = startTime.toISOString().split('T')[0];
        let aPayload = req.data.PostingData;
        let aFilename = req.data.FileName;
        const userEmail = req.data.UserEmail;

        let aInputToProcedure = _convertInputForProcedure(aPayload);
        let res, aError, output, result, endTime;
        let booResult = true;
        try {
            output = await _callHdbProcedure("factoryproduct", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            res = output.outputScalar;
            aError = output.results;
            booResult = true;
            // Record end time
            endTime = new Date();
            if (aError.length != 0) {
                await _callHdbProcedure("FactoryStatusResponse", { "I_PAYLOAD": aError, "FACTORYID": aPayload[0].factoryNumber, "INTERFACE": interface, "FILENAME": aFilename, "UPLOADEDTIME": formattedDate, "USEREMAIL": userEmail });
            }
            result = await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);
            let oResponseData = _getBulkUploadResponse(aError, aPayload.length, res.INSERTED_ROWS, res.UPDATED_ROWS, res.DUPLICATE_ROWS, res.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            booResult = false;
            // Record end time
            endTime = new Date();
            result = await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    const masterUpload = async function (req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface) {
        try {
            const tx = cds.transaction(req);
            let existingData = await tx.run(SELECT.from(syn_FactoryStatusDashboard).where({ fileName: aFilename })).catch((error) => {
                req.error({ "type": "Error", "message": error.message });
            });

            // Calculate processing time
            let processTime = (endTime - startTime) + "ms";
            // result success or fail
            let booleanResult = (booResult == true) ? "Success" : "Failed";
            let processResult = (booResult == true) ? "Completed" : "Error";

            let nInserted = 0;
            let nUpdated = 0;
            const today = new Date();
            // Formating the date as YYYY-MM-DD
            const formattedDate = today.toISOString().split('T')[0];

            let insertData = {
                factoryId: aPayload[0].factoryNumber,
                interface: interface,
                fileName: aFilename,
                date: formattedDate,
                processTime: processTime,
                status: booleanResult,
                records: aPayload.length, 
                successfulRecords: (res.INSERTED_ROWS != undefined ? res.INSERTED_ROWS : 0) + (res.UPDATED_ROWS != undefined ? res.UPDATED_ROWS : 0),
                errorRecords: aError ? aError.length : 0,
                prococessing: processResult,
                uploadedtime: startTime
            };
            if (existingData && existingData.length > 0) {
                let existingProcessTime = parseInt(existingData[0].processTime.split('ms')[0]);
                let updateProcessTime = parseInt(processTime.split('ms')[0]);
                updateProcessTime = existingProcessTime + updateProcessTime;
                let updateData = {
                    date: formattedDate,
                    processTime: updateProcessTime + "ms",
                    status: existingData[0].status == "Success" ? booleanResult : "Failed",
                    records: existingData[0].records + aPayload.length,
                    successfulRecords: existingData[0].successfulRecords + (res.INSERTED_ROWS != undefined ? res.INSERTED_ROWS : 0) + (res.UPDATED_ROWS != undefined ? res.UPDATED_ROWS : 0),
                    errorRecords: existingData[0].errorRecords + aError.length
                };
                await tx.run(UPDATE.entity(syn_FactoryStatusDashboard).data(updateData).where({ fileName: aFilename, })).catch((error) => {
                    req.error({ "type": "Error", "message": error.message });
                });

            } else {
                await tx.run(INSERT.into(syn_FactoryStatusDashboard).entries(insertData)).catch((error) => {
                    req.error({ "type": "Error", "message": error.message });
                });
            }
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    }

    /*********************** Location Product Master Upload ***********************/
    this.on('LocProdMasterUpload', async (req) => {
        let interface = "LocationProducts";
        // Record start time
        let startTime = new Date();
        // Formating the date as YYYY-MM-DD
        const formattedDate = startTime.toISOString().split('T')[0];
        let aPayload = req.data.PostingData;
        let aFilename = req.data.FileName;
        const userEmail = req.data.UserEmail;

        let aInputToProcedure = _convertInputForProcedure(aPayload);
        let res, aError, output, result, endTime;
        let booResult = true;
        try {
            output = await _callHdbProcedure("factoryproductlocation", { "I_PAYLOADPRODLOC": aInputToProcedure, "USEREMAIL": userEmail });
            res = output.outputScalar;
            aError = output.results;
            booResult = true;
            // Record end time
            endTime = new Date();
            if (aError.length != 0) {
                await _callHdbProcedure("FactoryStatusResponse", { "I_PAYLOAD": aError, "FACTORYID": aPayload[0].factoryNumber, "INTERFACE": interface, "FILENAME": aFilename, "UPLOADEDTIME": formattedDate, "USEREMAIL": userEmail });
            }
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);

            let oResponseData = _getBulkUploadResponse(aError, aPayload.length, res.INSERTED_ROWS, res.UPDATED_ROWS, res.DUPLICATE_ROWS, res.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            booResult = false;
            // Record end time
            endTime = new Date();
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /*********************** UOM Upload ***********************/
    this.on('UomMasterUpload', async (req) => {
        let interface = "UOM";
        // Record start time
        let startTime = new Date();
        // Formating the date as YYYY-MM-DD
        const formattedDate = startTime.toISOString().split('T')[0];
        let aPayload = req.data.PostingData;
        let aFilename = req.data.FileName;
        const userEmail = req.data.UserEmail;

        let aInputToProcedure = _convertInputForProcedure(aPayload);
        let res, aError, output, result, endTime;
        let booResult = true;
        try {
            output = await _callHdbProcedure("factoryuom", { "I_UOMPAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            res = output.outputScalar;
            aError = output.results;
            booResult = true;
            // Record end time
            endTime = new Date();
            if (aError.length != 0) {
                await _callHdbProcedure("FactoryStatusResponse", { "I_PAYLOAD": aError, "FACTORYID": aPayload[0].factoryNumber, "INTERFACE": interface, "FILENAME": aFilename, "UPLOADEDTIME": formattedDate, "USEREMAIL": userEmail });
            }
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);

            let oResponseData = _getBulkUploadResponse(aError, aPayload.length, res.INSERTED_ROWS, res.UPDATED_ROWS, res.DUPLICATE_ROWS, res.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            booResult = false;
            // Record end time
            endTime = new Date();
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /*********************** TransLane Upload ***********************/
    this.on('TransLaneMasterUpload', async (req) => {
        let interface = "Translane";
        // Record start time
        let startTime = new Date();
        // Formating the date as YYYY-MM-DD
        const formattedDate = startTime.toISOString().split('T')[0];
        let aPayload = req.data.PostingData;
        let aFilename = req.data.FileName;
        const userEmail = req.data.UserEmail;

        let aInputToProcedure = _convertInputForProcedure(aPayload);
        let res, aError, output, result, endTime;
        let booResult = true;
        try {
            output = await _callHdbProcedure("factorytlane", { "I_TLANEPAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            res = output.outputScalar;
            aError = output.results;
            booResult = true;
            // Record end time
            endTime = new Date();
            if (aError.length != 0) {
                await _callHdbProcedure("FactoryStatusResponse", { "I_PAYLOAD": aError, "FACTORYID": aPayload[0].factoryNumber, "INTERFACE": interface, "FILENAME": aFilename, "UPLOADEDTIME": formattedDate, "USEREMAIL": userEmail });
            }
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);

            let oResponseData = _getBulkUploadResponse(aError, aPayload.length, res.INSERTED_ROWS, res.UPDATED_ROWS, res.DUPLICATE_ROWS, res.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            booResult = false;
            // Record end time
            endTime = new Date();
            await masterUpload(req, aPayload, aFilename, startTime, endTime, booResult, res, aError, interface);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /*********************** Base UOM data posting ************************/
    this.on('BaseUOMPosting', async (req) => {
        try {
            let oData = req.data;
            let oPayload = JSON.parse(oData.PostingData);
            const userEmail = oData.UserEmail;
            oPayload.modifiedBy = userEmail;
            let sOperation = oData.Operation;
            let nInserted = 0;
            let nDeleted = 0;
            resLog = [];
            const tx = cds.transaction(req);
            if (sOperation === CONSTCRUD.Create) {
                let insertresult = await tx.run(INSERT.into(BaseUOM).entries(oPayload)).catch((error) => {
                    resLog.push({ "type": "Error", "message": error.message });
                });
                nInserted = insertresult.affectedRows;
            }
            if (sOperation === CONSTCRUD.Delete) {
                let deleteresult = await tx.run(DELETE.from(BaseUOM).where({ uomAlt: oPayload.uomAlt })).catch((error) => {
                    resLog.push({ "type": "Error", "message": error.message });
                });
                nDeleted = deleteresult.affectedRows;
            }
            if (nInserted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemCreated") });
            if (nDeleted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemDeleted") });
            return JSON.stringify(resLog);
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /***********************EDI Conversion data posting ************************/
    this.on('EDIConversionPosting', async (req) => {
        try {
            let oData = req.data;
            let oPayload = JSON.parse(oData.PostingData);
            const userEmail = oData.UserEmail;
            oPayload.modifiedBy = userEmail;
            let sOperation = oData.Operation;
            let nInserted = 0;
            let nDeleted = 0;
            resLog = [];
            const tx = cds.transaction(req);
            if (sOperation === CONSTCRUD.Create) {
                let insertresult = await tx.run(INSERT.into(EDIConversion).entries(oPayload)).catch((error) => {
                    resLog.push({ "type": "Error", "message": error.message });
                });
                nInserted = insertresult.affectedRows;
            }
            if (sOperation === CONSTCRUD.Delete) {
                let deleteresult = await tx.run(DELETE.from(EDIConversion)
                    .where({ factoryNumber: oPayload.factoryNumber, tdUOM: oPayload.tdUOM })).catch((error) => {
                        resLog.push({ "type": "Error", "message": error.message });
                    });
                nDeleted = deleteresult.affectedRows;
            }
            if (nInserted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemCreated") });
            if (nDeleted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemDeleted") });
            return JSON.stringify(resLog);
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /***********************UOM Conversion data posting ************************/
    this.on('UOMConversionPosting', async (req) => {
        try {
            let oData = req.data;
            let oPayload = JSON.parse(oData.PostingData);
            const userEmail = oData.UserEmail;
            oPayload.modifiedBy = userEmail;
            let sOperation = oData.Operation;
            let nInserted = 0;
            let nDeleted = 0;
            resLog = [];
            const tx = cds.transaction(req);
            if (sOperation === CONSTCRUD.Create) {
                let insertresult = await tx.run(INSERT.into(UOMConversion).entries(oPayload)).catch((error) => {
                    resLog.push({ "type": "Error", "message": error.message });
                });
                nInserted = insertresult.affectedRows;
            }
            if (sOperation === CONSTCRUD.Delete) {
                let deleteresult = await tx.run(DELETE.from(UOMConversion)
                    .where({ factoryNumber: oPayload.factoryNumber, prodId: oPayload.prodId, uomAlt: oPayload.uomAlt })).catch((error) => {
                        resLog.push({ "type": "Error", "message": error.message });
                    });
                nDeleted = deleteresult.affectedRows;
            }
            if (nInserted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemCreated") });
            if (nDeleted > 0)
                resLog.push({ "type": "Success", "message": bundle.getText("ItemDeleted") });
            return JSON.stringify(resLog);
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    /*********************** Background job schedular for TransferJob ***********************/
    this.on('TransferJob', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            // afterwards the actual processing
            var finalResult = await handleAsyncJob(req.headers, req);
            return finalResult;
        }
        catch (error) {
            return req.error(error.code, error.message);
        }
    });

    /***********************Download Template Service ************************/
    this.on('downloadTemplate', async (req) => {
        try {
            let { templateName } = req.data;

            const template = _downloadTemplate(templateName);
            if (!template) {
                return req.error(bundle.getText("templateErrorMsg"))
            }
            return template;
        } catch (error) {
            return req.error(error);
        }
    });

    /***********************Upload Template Service ************************/
    this.on('customMasterUpload', async (req) => {
        let res;
        let aError = [];
        let aPayload = [];
        let errorLen = 0;
        const { payload, templateName, UserEmail } = req.data;
        try {
            const { validatedHeaders, items, validatedItems } = _convertCsvToJSON(payload);
            const isValidItems = _isValidRecords(validatedHeaders, templateName, validatedItems);
            if (typeof isValidItems === 'object') {
                return req.error(isValidItems);
            }
            aPayload = items;
            if (!aPayload.length) {
                return req.error({
                    message: bundle.getText("blankMassUpload"),
                    status: 500
                });
            }

            const templateObj = TEMPLATE_INFO.find(val => val.ID.toUpperCase() === templateName.toUpperCase());
            if (templateObj) {
                const procedureName = templateObj.value;
                const I_PAYLOAD = templateObj.payload;
                const output = await _callHdbProcedure(procedureName, { [I_PAYLOAD]: aPayload, "USEREMAIL": UserEmail });
                res = output.outputScalar;
                aError = output.results;
                errorLen = aError.length;
                await _callHdbProcedure("massupload", { "I_PAYLOAD": aError, "APPNAME": templateName, "INSERTED_ROWS": res.INSERTED_ROWS, "UPDATED_ROWS": res.UPDATED_ROWS, "ERROR_ROWS": errorLen, "USEREMAIL": UserEmail });
            } else {
                return req.error({
                    message: bundle.getText("templateErrorMsg"),
                    status: 500
                });
            }
            let oResponseData = _getBulkUploadResponse(aError, aPayload.length, res.INSERTED_ROWS, res.UPDATED_ROWS, res.DUPLICATE_ROWS, res.DELETED_ROWS);
            return oResponseData;
        } catch (error) {
            return req.error(500, bundle.getText("UploadError", [templateName]));
        }
    });

    /***********************Get Template List Service ************************/
    this.on('READ', 'TemplateList', async (req) => {
        return TEMPLATE_LIST;
    });

    /***********************Merge Split Service ************************/
    this.on('merge_split', async (req) => {
        try {
            let msgLog = [];
            let res;
            let oData = req.data;
            let aPayload = oData.PostingData;
            let sOperation = oData.Operation;
            const userEmail = oData.UserEmail;
            let mvalue = oData.MergeValue;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            const output = await _callHdbProcedure("factoryproductsplitandmerge", { "ACTIONS": sOperation, "DELTA_INPUT": aInputToProcedure, "MERGEVALUE": mvalue, "USEREMAIL": userEmail });
            msgLog.push({ "type": "Success", "message": bundle.getText("UpdateSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });

    /***********************masterFlag for manage part mapping posting ************************/
    this.on('MasterFlag', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.PostingData;
            const userEmail = oData.UserEmail;
            const tx = cds.transaction(req);
            let aUpdateItems = [];
            for (let item of aPayload) {
                // Strategicautoflag value
                const masterFlagValue = (item.master == 'X' || item.master == 'x') ? item.master : null;
                if (item.master !== "HP" && item.zbtpComp.startsWith('PUM')) {
                    aUpdateItems.push(
                        UPDATE.entity(BTPCompSequence).
                            data({
                                master: masterFlagValue,
                                modifiedBy: userEmail
                            }).where({ prodId: item.prodId, factoryNumber: item.factoryNumber }));
                }

            }
            try {
                await tx.run(aUpdateItems);
                msgLog.push({ "type": "Success", "message": bundle.getText("Successfully Record Updated") });
                return JSON.stringify(msgLog);
            } catch (err) {
                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
            }
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

    this.on('TlaneDeletionData', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.TlaneDelData;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            let output = await _callHdbProcedure("TlaneDeletion", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            msgLog.push({ "type": "Success", "message": bundle.getText("DeleteSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });
    
    this.on('ProdLocDeletionData', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.ProdLocDelData;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            let output = await _callHdbProcedure("facProdLocDeletion", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            msgLog.push({ "type": "Success", "message": bundle.getText("DeleteSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });

    this.on('ProdDeletionData', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.ProdDelData;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            let output = await _callHdbProcedure("ProductDeletion", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            msgLog.push({ "type": "Success", "message": bundle.getText("DeleteSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });
});