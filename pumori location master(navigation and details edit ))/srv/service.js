const cds=require('@sap/cds');
const TextBundle=require('@sap/textbundle').TextBundle;
const bundle=new TextBundle('./_i18n/i18n');
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
const XLSX = require("xlsx");
const express = require('express');
const {PumoriLocations} = cds.entities('pumorips.pumorilocation');
const { ERROR_STATUS_CODE,
    SUCCESS_STATUS_CODE,
    RESULT_STATUS_CODE,
    ACCEPT_STATUS_CODE,
    CONSTPROPS, PUMLOCCONST } = require('./constants');
const { _getBulkUploadResponse, _callHdbProcedure } = require('./commonhelper');
const { _getResponse} = require('./mergehelper');
const { doUpdateStatus } = require('./jobscheduler/scheduler');

module.exports=cds.service.impl(async function(){

    let securityScope = {
        "Display": false,
        "Edit": false
    };


    this.on("SecurityAction", async (req) => {
        var requestAuthInfo = req.req.authInfo;
        
        securityScope.Display = requestAuthInfo.checkLocalScope('Display');
        securityScope.Edit = requestAuthInfo.checkLocalScope('Edit');


        return JSON.stringify(securityScope);
    });

    this.on('UpdatePumoriLocation',async (req) => {
    try{
            let msgLog=[];
            let oData=req.data;
            let aPayload=JSON.parse(oData.LocData);
            const tx=cds.transaction(req);
            let resLocation = await tx.run(UPDATE.entity(PumoriLocations).
                data({
                    vendorGroup: aPayload.newVendorGrp,
                    Keeperflag : 'X',
                    modifiedBy: aPayload.modifiedBy
                }).where({ locId: aPayload.locId, locType: aPayload.locType })).catch((error) => {
                    msgLog.push({ "type": "Error", "message": error.message });
                });

                let aInputToProcedure = [{
                    LOCID       :      aPayload.locId,              
                    LOCTYPE     :      aPayload.locType,   
                    OLDVENDORGRP:      aPayload.oldVendorGrp,
                    NEWVENDORGRP:      aPayload.newVendorGrp
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
                        }).where({ locId: item.locId }));}
            
                let Result= await tx.run(aUpdateItems);

                if(Result.length!==0){

                msgLog.push({ "type": "Success", "message": bundle.getText("Update Done Successfully") });
                return JSON.stringify(msgLog);
                
                }
                else{

                return req.error({ code: ERROR_STATUS_CODE, message: err.message });
                }
            
        }
        catch (error) {
            console.log(error);
            return req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    });


    
});