const cds = require('@sap/cds');
const TextBundle = require('@sap/textbundle').TextBundle;

const bundle = new TextBundle('./_i18n/i18n');
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
const express = require('express');
const { FaclocTransformation, syn_FactoryStatusDashboard } = cds.entities('pumorips.factorylocation');
const { _getResponse } = require('./helper');
const { doUpdateStatus } = require('./jobscheduler/scheduler');

const { _convertInputForProcedure, _callHdbProcedure, _getBulkUploadResponse } = require('./validation');
const { ERROR_STATUS_CODE, CONSTCRUD, ACCEPT_STATUS_CODE } = require('./constants');

module.exports = cds.service.impl(async function () {
    let securityScope = {
        "Edit": false,
        "Display": false
    };
    /*********************** Security Check Module************************************/
    this.on("SecurityAction", async (req) => {
        var requestAuthInfo = req.req.authInfo;


        securityScope.Display = requestAuthInfo.checkLocalScope('Display');
        securityScope.Edit = requestAuthInfo.checkLocalScope('Edit');

        return JSON.stringify(securityScope);
    });

    /*********************** Factory Product Master Upload ***********************/
    this.on('FacLocMasterUpload', async (req) => {
        let interface = "FactoryLocations";
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
            output = await _callHdbProcedure("factorylocation", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
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

    this.on('FactoryTransformUpload', async (req) => {
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
            let output = await _callHdbProcedure("facloctransformation", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            let result = output.outputScalar;
            var oResponseData = _getResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS);
            return oResponseData;
        }
        catch (error) {
            req.error({ code: ERROR_STATUS_CODE, message: error.message });
        }
    }

    this.on('FacLocDeletionData', async (req) => {
        try {
            let msgLog = [];
            let oData = req.data;
            let aPayload = oData.FacLocDelData;
            let userEmail = oData.UserEmail;
            let aInputToProcedure = _convertInputForProcedure(aPayload);
            let output = await _callHdbProcedure("facLocDeletion", { "I_PAYLOAD": aInputToProcedure, "USEREMAIL": userEmail });
            msgLog.push({ "type": "Success", "message": bundle.getText("DeleteSuccess") });
            return JSON.stringify(msgLog);
        }
        catch (error) {
            return req.error(error);
        }
    });
});