const cds = require('@sap/cds');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
const XLSX = require("xlsx");
const express = require('express');
const { PumoriLocations, OpsiIdResponse } = cds.entities('pumorips.pumorilocation');
const { ERROR_STATUS_CODE,
    SUCCESS_STATUS_CODE,
    RESULT_STATUS_CODE,
    ACCEPT_STATUS_CODE,
    CONSTPROPS, PUMLOCCONST } = require('./constants');
const { _getBulkUploadResponse, _callHdbProcedure } = require('./commonhelper');
const { _getResponse } = require('./mergehelper');
const { doUpdateStatus } = require('./jobscheduler/scheduler');
const { executeHttpRequest } = require('@sap-cloud-sdk/http-client');
const axios = require('axios');
var querystring = require('querystring');
const { getDestination } = require("@sap-cloud-sdk/connectivity");


module.exports = cds.service.impl(async function () {

    let securityScope = {
        "WithView": false,
        "WithEdit": false
    };

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
    async function callMulesoftAPI( req ) {
        try {
            let USER_TOKEN = '';
            const tx = cds.transaction(req);
            
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
                    console.log(response.data);
                    USER_TOKEN = response.data.access_token;
                })
                .catch((error) => {
                    console.log('error ' + error);
                });

                let baseurl = destination.url;
                // let baseurl = "https://hpit-gw-dev.hpcloud.hp.com";
                const parametersList = await tx.run(SELECT.from(PumoriLocations).where(
                    'locId not in (SELECT distinct locId FROM pumorips.pumorilocation.OpsiIdResponse)'
                ) ); 
                let aResponse=[];
                // let count = 0;  // count for testing minimum records
                for (let i = 0; i < parametersList.length; i++) {
                    
                    const params = parametersList[i];
                    var url = baseurl+`/generic-router-transform/api/getreltiomatch?enriched=true&`;
                    if((params.locDescr != '' && params.locDescr != null) && (params.countryCode  != '' && params.countryCode  != null)){
                        // count++;
                        // if(count == 3)
                        //     break;
                        url = url+`name=${params.locDescr}` + `&country=${params.countryCode }`;
                        if(params.locationAddress1 !='' && params.locationAddress1 != null){
                            url = url + `&addressLine=${params.locationAddress1}`
                        }
                        if(params.city != '' && params.city != null){
                            url = url + `&city=${params.city}`
                        }
                        if(params.zipcode != '' && params.zipcode != null){
                            url = url + `&postalCode=${params.zipcode}`
                        }
                    }
                    else{
                        continue;
                    }
                    
                     url = url + `&mode=match&max=5`;
                     console.log("url ",url);
                     
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
                                    locId: params.locId
                                }));
                            }
                        }
                    })
                    .catch((error) => {
                        console.log('Error in API call for', error);
                    });
                }
                await tx.run(aResponse);
            return 'run';
        } catch (err) {
            console.log(err.message);
        }
    };




    this.on("SecurityAction", async (req) => {
        var requestAuthInfo = req.req.authInfo;
        const authToken =  req.headers.authorization;
        console.log(authToken);
        securityScope.WithView = requestAuthInfo.checkLocalScope('WithView');
        securityScope.WithEdit = requestAuthInfo.checkLocalScope('WithEdit');


        return JSON.stringify(securityScope);
    });

    this.on('UpdatePumoriLocation', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = JSON.parse(oData.LocData);
            const tx = cds.transaction(req);
            let resLocation = await tx.run(UPDATE.entity(PumoriLocations).
                data({
                    vendorGroup: aPayload.newVendorGrp,
                    Keeperflag: aPayload.Keeperflag,
                    opsiId: aPayload.opsiId,
                    modifiedBy: aPayload.modifiedBy
                }).where({ locId: aPayload.locId, locType: aPayload.locType })).catch((error) => {
                    msgLog.push({ "type": "Error", "message": error.message });
                });

            let aInputToProcedure = [{
                LOCID: aPayload.locId,
                LOCTYPE: aPayload.locType, 
                OLDVENDORGRP: aPayload.oldVendorGrp,
                NEWVENDORGRP: aPayload.newVendorGrp
            }];
            let output = await _callHdbProcedure("vendorgroupupdate", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": aPayload.modifiedBy });
            let aError = output.results;
            if (resLocation && resLocation > 0 && aError.length == 0) {
                msgLog.push({ "type": "Success", "message": bundle.getText("LocationUpdated") });
            }
            return JSON.stringify(msgLog);
        }
        catch (error) {
            console.log(error);
        }
    });
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

            //let output = await _callHdbProcedure("pumoriloc", {});

            let output = await _callHdbProcedure("pumorilocmerge", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            let result = output.outputScalar
            var oResponseData = _getResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    };

    //consolodated location ID update--------

    this.on('ConsolidatedID', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.PostingData;
            let userEmail = oData.UserEmail;
            const tx = cds.transaction(req);
            let aUpdateItems = [];
            for (let item of aPayload) {
                aUpdateItems.push(
                    UPDATE.entity(PumoriLocations).
                        data({
                            mainPlant: item.mainPlant,
                            modifiedBy: userEmail
                        }).where({ locId: item.locId }));
            }

            let Result = await tx.run(aUpdateItems);

            if (Result.length !== 0) {

                msgLog.push({ "type": "Success", "message": bundle.getText("Update Done Successfully") });
                return JSON.stringify(msgLog);

            }
            else {

                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
            }

        }
        catch (error) {
            console.log(error);
            return req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });
    
    
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