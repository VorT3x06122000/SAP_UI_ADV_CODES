const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const { doUpdateStatus } = require('./jobscheduler/scheduler');
const { _callHdbProcedure, _getBulkUploadResponse, _getResponse } = require('./validation');
const { ERROR_STATUS_CODE } = require('./constants');

/************************Handle job for TransferJob *******************************/
const handleAsyncJob = async function (headers, req) {
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

/***********************Operation for TransferJob *******************************/
const operationMasterUpload = async function (req) {
    try {
        let nDays = req.data.Days;
        let sFactoryNumber = req.data.FactoryNumber;
        let sServiceName = req.data.ServiceName;
        let aFactoryNumber = [];
        let aInputToProcedure = [];
        var dayscount;
        if (sFactoryNumber != null) {
            aFactoryNumber = sFactoryNumber.split(",");
            aFactoryNumber.map(item => {
                let o1 = {};
                o1.FACTORYNUMBER = item;
                aInputToProcedure.push(o1);
            });
        }
        if (nDays === null || nDays === 0 || nDays === undefined || nDays === '')
            dayscount = null;
        else
            dayscount = nDays;

        var output, result, oResponseData;
        if (sServiceName === 'factoryProduct') {
            output = await _callHdbProcedure("producttransformation", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            result = output.outputScalar
        }
        else if (sServiceName === 'TLane') {
            output = await _callHdbProcedure("factorytlanetransformation", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            result = output.outputScalar
        }
        else if (sServiceName === 'facProdLoc') {
            output = await _callHdbProcedure("facprodLoctransformation", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
            result = output.outputScalar
        }
        oResponseData = _getResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS);
        return oResponseData;
    }
    catch (error) {
        req.error({ code: ERROR_STATUS_CODE, message: error.message });
    }
}

module.exports = {
    handleAsyncJob
}