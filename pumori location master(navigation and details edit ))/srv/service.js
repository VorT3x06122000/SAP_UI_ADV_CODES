//-----------------------------------------------------------------------------------*
//Confidential and Proprietary
//Copyright 2021, HP
//All Rights Reserved
//-----------------------------------------------------------------------------------*
// Application Name :    Manage Pumori Location Master
// WRICEF No        : 
// Release          :    M1 Release
// Author           :    MatheRos
// Date             :    04.01.2022
// Description      :    Manage Pumori Location Master 
//-----------------------------------------------------------------------------------*
//Descriptions: Holds logic for services
//-----------------------------------------------------------------------------------*
//Change Log:
//    Date      |   Author      |   Defect/Incident     |   Change Description
//  06.01.2022  |   MatheRos    |     ODW Release       |    CR Changes
//  06.13.2022  |   MatheRos    |     M2 Release        |    CR Changes
//  12.22.2022  |   JaAyushi    |     CR-22             |    Location MasterList Table added in code logic for UI.
//-----------------------------------------------------------------------------------*/

const cds = require('@sap/cds');
// const { Worker } = require('worker_threads');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const XLSX = require("xlsx");
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
const express = require('express');
const passport = require('passport');
const xsenv = require('@sap/xsenv');
const JWTStrategy = require('@sap/xssec').JWTStrategy;
//configure passport
const xsuaaService = xsenv.getServices({ myXsuaa: { tag: 'xsuaa' } });
const xsuaaCredentials = xsuaaService.myXsuaa;
const jwtStrategy = new JWTStrategy(xsuaaCredentials);
passport.use(jwtStrategy);
// configure express server with authentication middleware
const app = express();
app.use(passport.initialize());
app.use(passport.authenticate('JWT', { session: false }));
const https = require('https');
// access credentials from environment variable (alternatively use xsenv)
const VCAP_SERVICES = JSON.parse(process.env.VCAP_SERVICES)
const CREDENTIALS = VCAP_SERVICES.jobscheduler[0].credentials
//oauth
const UAA = CREDENTIALS.uaa
const OA_CLIENTID = UAA.clientid;
const OA_SECRET = UAA.clientsecret;
const OA_ENDPOINT = UAA.url;
const { PumoriLocations,OpsiIdResponse, syn_LocationMasterList } = cds.entities('pumori.pumorilocation');
const { ERROR_STATUS_CODE,
    SUCCESS_STATUS_CODE,
    RESULT_STATUS_CODE,
    ACCEPT_STATUS_CODE,
    CONSTPROPS, PUMLOCCONST } = require('./constants');
    
const { executeHttpRequest } = require('@sap-cloud-sdk/http-client');
const axios = require('axios');
var querystring = require('querystring');
const { getDestination } = require("@sap-cloud-sdk/connectivity");

module.exports = cds.service.impl(async function () {

    this.on("MulesoftAPIJobSchedular", async(req)=>{
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            let finalResult = await handleAsyncJobs(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });
    async function handleAsyncJobs(headers, req) {
        try {
            let result = await callMulesoftAPI(req)
            if ((typeof result !== 'undefined') && (result !== null)) {
                await doUpdateStatus(headers, true, result)
                return result;
            } else {
                await callMulesoftAPI(req)
            }
        } catch (error) {
            doUpdateStatus(headers, false, error.message)
                .then(() => {
                    console.log(bundle.getText('successResJob'))
                }).catch((error) => {
                    console.log(bundle.getText('errResJob') + error)
                })
        }
    }
    async function callMulesoftAPIToken(){
        let USER_TOKEN = '';
            const destinationName = 'Mulesoft-OAuth';
            const destination = await getDestination({destinationName});
            const tokenUrl = destination.tokenServiceUrl;
            const clientId = destination.clientId;  // From your OAuth configuration
            const clientSecret = destination.clientSecret;
            // const destinationName = 'Mulesoft-OAuth';
            // const destination = 'Mulesoft-OAuth';
            // const tokenUrl = " https://login-itg.external.hp.com/as/token.oauth2";
            // const clientId = "bbd68080-1951-4ff4-b2cc-77f3655a8059";  // From your OAuth configuration
            // const clientSecret = "1pH33ePXYk4RbHqeddxDWCYnrD2hksn916TK6MlZiX3ZPuQuYe";
            const data = {
                client_id: clientId,
                client_secret: clientSecret
            };
            await axios.post(tokenUrl + '?grant_type=client_credentials', querystring.stringify(data))
                .then(response => {
                    USER_TOKEN = response.data.access_token;
                })
                .catch((error) => {
                    console.log('error ' + error);
                });
 
                
            return {USER_TOKEN};
    }
    async function callMulesoftAPI( req ) {
        try {
            
            const tx = cds.transaction(req);
           
            const destinationName = 'Mulesoft-OAuth';
            const destination = await getDestination({destinationName});
            let baseurl = destination.url;
                // let baseurl = "https://hpit-gw-dev.hpcloud.hp.com";
                const parametersList = await tx.run(SELECT.from(PumoriLocations).where(
                                    'locId not in (SELECT distinct locId FROM pumori.pumorilocation.OpsiIdResponse)'
                                ) );
                let aResponse=[];
                // let count = 0;  // count for testing minimum records
                for (let i = 0; i < parametersList.length; i++) {
                   
                    const params = parametersList[i];
                    var url = baseurl+`/generic-router-transform/api/getreltiomatch?enriched=true&`;
                    if((params.locDescr != '' && params.locDescr != null) && (params.zcountry   != '' && params.zcountry   != null)){
                        // count++;
                        // if(count == 500)
                        //     break;
                        url = url+`name=${params.locDescr.replace(/[^a-zA-Z0-9\s]/g, '')}` + `&country=${params.zcountry.replace(/[^a-zA-Z0-9\s]/g, '') }`;
                        if(params.locationAddress1 !='' && params.locationAddress1 != null){
                            url = url + `&addressLine=${params.locationAddress1.replace(/[^a-zA-Z0-9\s]/g, '')}`
                        }
                        if(params.city != '' && params.city != null){
                            url = url + `&city=${params.city.replace(/[^a-zA-Z0-9\s]/g, '')}`
                        }
                        if(params.zipcode != '' && params.zipcode != null){
                            url = url + `&postalCode=${params.zipcode.replace(/[^a-zA-Z0-9\s]/g, '')}`
                        }
                    }
                    else{
                        continue;
                    }
                   
                     url = url + `&mode=match&max=5`;
                     console.log("url ",url);
                     const { USER_TOKEN } = await callMulesoftAPIToken(); 
                    // Make the API call for each set of parameters
                    await axios.get(url, {
                        headers: {
                            'token': USER_TOKEN,
                            'AuthMethod': 'jwt',
                            'x-api-key': 'bulusu.avanthi@hp.com',
                            'callDnb': 'true',
                        }
                    })
                    .then(response => {
                        console.log('Response ', response.data);
       
                        // Save the response data in the entity
                        // const { OpsiIdResponse } = this.entities;
                       
                        // Assuming the response has 'IT_Apollo_response' field with multiple
                        if(response.data[0]["total records"] >0){
                            for (const partner of response.data[0].IT_Apollo_response) {
                                aResponse.push( INSERT.into(OpsiIdResponse).entries({
                                    opsiId: partner['OPSI ID'],
                                    matchScore: partner['Match Score'],
                                    name: partner.Name,
                                    country: partner.country,
                                    countryCode:partner.Country,
                                    city: partner.City,
                                    postalCode: partner['Postal Code'],
                                    street1: partner.Street1,
                                    state: partner.State,
                                    locId: params.locId,
                                    dunsNumber:partner['dunsNumber']
                                }));
                            }
                        }
                        else{  
                            aResponse.push((UPDATE.entity(PumoriLocations).data({
                                opsiflag:'N/A'
                            }).where({ locId: params.locId})))  
                        }
                    })
                    .catch((error) => {
                        console.log("entire error ", JSON.stringify(error));
                        console.log('Error in API call for', error.message);
                    });
                }
                await tx.run(aResponse);
            return 'run';
        } catch (err) {
            console.log(err.message);
        }
    };

    

    /**************Service for Pumori Location single record update from UI*****************/
    this.on('UpdatePumoriLocation', async (req) => {
        try {
            msgLog = [];
            let oData = req.data;
            let aPayload = JSON.parse(oData.LocData);
            const tx = cds.transaction(req);
           /* if (aPayload.zsupplierName !== CONSTPROPS.Pending) {
                let aMasterList = await tx.run(SELECT.from(syn_LocationMasterList, ['zmanuName', 'stdManuName']).where({ zsupplierName: aPayload.zsupplierName })).catch((error) => req.error({ code: ERROR_STATUS_CODE, message: error.message }))
                szmanuName = (aMasterList.length > 0) ? aMasterList[0].stdManuName : CONSTPROPS.Pending;
                szmanuNameOf = (aMasterList.length > 0) ? aMasterList[0].zmanuName : null;
            }
            else if (aPayload.zsupplierName === CONSTPROPS.Pending) {
                szmanuName = CONSTPROPS.Pending;
                szmanuNameOf = null;
            }*/
            //Pumori Location table update- single item
            let resLocation = await tx.run(UPDATE.entity(PumoriLocations).
                data({
                    zlocPriority: aPayload.zlocPriority,
                    zMarket: aPayload.zMarket,
                    zGoc: aPayload.zGoc,
                    opsiId: aPayload.opsiId,
                    // zsupplierName: aPayload.zsupplierName,
                    // zmanuName: szmanuName,
                    // zmanuNameOf: szmanuNameOf,
                    modifiedBy: aPayload.modifiedBy
                }).where({ locId: aPayload.locId, locType: aPayload.locType })).catch((error) => {
                    msgLog.push({ "type": "Error", "message": error.message });
                });

            if (resLocation && resLocation > 0) {
                msgLog.push({ "type": "Success", "message": bundle.getText("LocationUpdated") });
            }
            return JSON.stringify(msgLog);
        }
        catch (error) {
            console.log(error);
        }
    });
    /**************Main Service for Pumori Location*****************/
    this.on('PumoriLocUpload', async (req) => {
        try {
            req.notify(ACCEPT_STATUS_CODE, bundle.getText('longRunAccept'));
            let finalResult = await handleAsyncJob(req.headers, req);
            return finalResult;
        }
        catch (error) {
            console.log(error);
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });
    /************************Mass Upload Pumori Location****************************************** */
    this.on('MassUploadPumLoc', async (req) => {
        try {
            let payload = req.data.excelpayloadPumLoc;
            let workbook = XLSX.read(payload, { type: "base64" });
            let sheet_name_list = workbook.SheetNames;
            let aData = [];
            let aMassPumLocData = [];
            let isHeaderexists = {};
            sheet_name_list.forEach(function (y) {
                let worksheet = workbook.Sheets[y];
                let headers = {};
                for (z in worksheet) {
                    if (z[0] === "!") continue;
                    let col = z.substring(0, 1);
                    let row = parseInt(z.substring(1));
                    let value = worksheet[z].v;
                    //store header names
                    if (row == 1) {
                        headers[col] = value;
                        isHeaderexists[value] = true;
                        continue;
                    }
                    if (!aData[row]) aData[row] = {};
                    aData[row][headers[col]] = value;
                }
                //drop those first two rows which are empty
                aData.shift();
                aData.shift();
            })
            aMassPumLocData = aData;
            let res1 = false;
            if (isHeaderexists[PUMLOCCONST.locId]) {
                res1 = true;
            }
            let res2 = false;
            if (isHeaderexists[PUMLOCCONST.locType]) {
                res2 = true;
            }
            let res3 = false;
            if (isHeaderexists[PUMLOCCONST.zlocPriority] || isHeaderexists[PUMLOCCONST.zMarket] || isHeaderexists[PUMLOCCONST.zGoc]) {
                res3 = true;
            }
            if (res3 === false) {
                req.error(417, bundle.getText('NoEditcoloum'));
            }
            else if (!res1 || !res2) {
                req.error(417,bundle.getText('NoKeycoloum'));
            }
            else {
                async function mainOperation() {
                    let ModifiedBy = req.data.UserEmail;
                    // let reszsupplierName = false;
                    // if (isHeaderexists[PUMLOCCONST.zsupplierName]) {
                    //     reszsupplierName = true;
                    // }
                    let reszlocPriority = false;
                    if (isHeaderexists[PUMLOCCONST.zlocPriority]) {
                        reszlocPriority = true;
                    }
                    let reszMarket = false;
                    if (isHeaderexists[PUMLOCCONST.zMarket]) {
                        reszMarket = true;
                    }
                    let reszGoc = false;
                    if (isHeaderexists[PUMLOCCONST.zGoc]) {
                        reszGoc = true;
                    }

                    let aInputToProcedure = [];
                    aMassPumLocData.map(element => {
                        let o1 = {};
                        let sLOCID = element[PUMLOCCONST.locId];
                        let sLOCTYPE = element[PUMLOCCONST.locType];
                        // let sZSUPPLIERNAME = reszsupplierName ? element[PUMLOCCONST.zsupplierName] : null;
                        let sZLOCPRIORITY = reszlocPriority ? element[PUMLOCCONST.zlocPriority] : null;
                        let sZMARKET = reszMarket ? element[PUMLOCCONST.zMarket] : null;
                        let sZGOC = reszGoc ? element[PUMLOCCONST.zGoc] : null;
                        
                        o1.LOCID = sLOCID ? sLOCID.toString() : '';
                        o1.LOCTYPE = sLOCTYPE ? sLOCTYPE.toString() : '';
                        // o1.ZSUPPLIERNAME = sZSUPPLIERNAME ? sZSUPPLIERNAME.toString() : '';
                        // o1.ZLOCPRIORITY = (sZLOCPRIORITY !== null && sZLOCPRIORITY !== '')? sZLOCPRIORITY.toString() : '';
                        o1.ZLOCPRIORITY =(sZLOCPRIORITY !==null && sZLOCPRIORITY!=='' && sZLOCPRIORITY !== undefined)?sZLOCPRIORITY.toString():'' ;
                        o1.ZMARKET = sZMARKET ? sZMARKET.toString() : '';
                        o1.ZGOC = sZGOC ? sZGOC.toString() : '';
                        aInputToProcedure.push(o1);
                    }
                    );
                    await _callHdbProcedure("PumLocMassUpload", { "I_PUMLOC_MASSUPLOAD": aInputToProcedure, "I_MODIFIEDUSER": ModifiedBy });

                }
                mainOperation();
                return bundle.getText('resInprogress');
            }
        } catch (error) {
            console.log(error)
        }
    });
    /*************handle asynchronous Job Method*****************/
    async function handleAsyncJob(headers, req) {
        try {
            let result = await operationMasterUpload(req)
            if ((typeof result !== 'undefined') && (result !== null)) {
                await doUpdateStatus(headers, true, result)
                return result;
            } else {
                await operationMasterUpload(req)
            }
        } catch (error) {
            doUpdateStatus(headers, false, error.message)
                .then(() => {
                    console.log(bundle.getText('successResJob'))
                }).catch((error) => {
                    console.log(bundle.getText('errResJob') + error)
                })
        }
    }
    /*****************Pumori Location Upload method*******************/
    async function operationMasterUpload(req) {
        try {
            let nDays = req.data.Days;
            let sFactoryNumber = req.data.FactoryNumber;
            let aFactoryNumber = [];
            let aInputToProcedure = [];

            if (sFactoryNumber != null) {
                aFactoryNumber = sFactoryNumber.split(",");
                aFactoryNumber.map(item => {
                    let o1 = {};
                    o1.FACTORYNUMBER = item;
                    aInputToProcedure.push(o1);
                });
            }


            if (nDays === null || nDays === 0 || nDays === undefined || nDays === '')
                var dayscount = null;
            else
                dayscount = nDays;

            // let output = await _callHdbProcedure("pumoriloc", {});

            let output = await _callHdbProcedure("pumoriloc", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            let result = output.outputScalar
            var oResponseData = _getResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    }
    // This reusable function is used to make procedure call
    let _callHdbProcedure = async function (sProcedureName, oInputParams) {

        //call procedure
        const db = await cds.connect.to('db');
        const dbConn = new dbclass(await dbclass.createConnection(db.options.credentials));
        const sp = await dbConn.loadProcedurePromisified(hdbext, null, sProcedureName);
        var oDbProcedureRet = dbConn.callProcedurePromisified(sp, oInputParams);
        return oDbProcedureRet;
    }
    /************ JWT Token required for Calling REST API**************/
    function fetchJwtToken() {
        return new Promise((resolve, reject) => {
            const options = {
                host: OA_ENDPOINT.replace('https://', ''),
                path: '/oauth/token?grant_type=client_credentials&response_type=token',
                headers: {
                    Authorization: "Basic " + Buffer.from(OA_CLIENTID + ':' + OA_SECRET).toString("base64")
                }
            }
            https.get(options, res => {
                res.setEncoding('utf8')
                let response = ''
                res.on('data', chunk => {
                    response += chunk
                })
                res.on('end', () => {
                    try {
                        const responseAsJson = JSON.parse(response)
                        const jwtToken = responseAsJson.access_token
                        if (!jwtToken) {
                            return reject(new Error(bundle.getText('errFetchToken')))
                        }
                        resolve(jwtToken)
                    } catch (error) {
                        return reject(new Error(bundle.getText('errFetchToken')))
                    }
                })
            })
                .on("error", (error) => {
                    console.log("Error: " + error.message);
                    return reject({ error: error })
                });
        })
    }
    /*************method to set the status in Jobscheduler************/
    function doUpdateStatus(headers, success, message) {
        return new Promise((resolve, reject) => {
            return fetchJwtToken()
                .then((jwtToken) => {
                    const jobId = headers['x-sap-job-id']
                    const scheduleId = headers['x-sap-job-schedule-id']
                    const runId = headers['x-sap-job-run-id']
                    const host = headers['x-sap-scheduler-host']
                    const data = JSON.stringify({ success: success, message: JSON.stringify(message) })
                    const options = {
                        host: host.replace('https://', ''),
                        path: `/scheduler/jobs/${jobId}/schedules/${scheduleId}/runs/${runId}`,
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json',
                            'Content-Length': data.length,
                            Authorization: 'Bearer ' + jwtToken
                        }
                    }
                    const req = https.request(options, (res) => {
                        res.setEncoding('utf8')
                        const status = res.statusCode
                        if (status !== SUCCESS_STATUS_CODE && status !== RESULT_STATUS_CODE) {
                            return reject(new Error(bundle.getText('updateStatusErr')))
                        }
                        res.on('data', () => {
                            console.log(bundle.getText('callJobSuccess'))
                            resolve(message)
                        })
                    });
                    req.on('error', (error) => {
                        console.log(bundle.getText('errCallJob'))
                        return reject({ error: error })
                    });
                    req.write(data)
                    req.end()
                })
                .catch((error) => {
                    console.log(error)
                    reject(error)
                })
        })
    }
    /*********************** Create response function************************/
    function _getResponse(nInserted, nUpdated, nDeleted) {
        let oResponse = {};
        //Response creation for success
        if (nInserted > 0 || nUpdated > 0 || nDeleted > 0) {
            oResponse['success'] = {};

            if (nInserted > 0)
                oResponse['success'].created = nInserted + bundle.getText('rowscreated');
            if (nUpdated > 0)
                oResponse['success'].updated = nUpdated + bundle.getText('rowsupdated');
            if (nDeleted > 0)
                oResponse['success'].deleted = nDeleted + bundle.getText('rowsdeleted');
        }
        return oResponse;
    }; 


    this.on('opsiIDItem', async (req) => {
        try {
            const tx = cds.transaction(req);
            const {locId,opsiId} = req.data;
            let OpsiData = await tx.run(SELECT.from(OpsiIdResponse).where({ locId }).orderBy(opsiId));
            return OpsiData ;
            
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });

});