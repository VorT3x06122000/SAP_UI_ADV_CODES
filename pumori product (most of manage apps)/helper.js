srv/pumoriprodloc/pumoriprodloc-helper.js



const { doUpdateStatus } = require('../jobscheduler/scheduler');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('../_i18n/i18n');
const { _callHdbProcedure, _getBulkUploadResponse } = require('../commonhelper');
const { ERROR_STATUS_CODE } = require('../constants');

/************************Handle job for Pumori Product Location Master *******************************/
const handleAsyncJobLocMasterUpload = async function (headers, req) {
    try {
        let result = await operationLocMasterUpload(req)
        if ((typeof result !== 'undefined') && (result !== null)) {
            await doUpdateStatus(headers, true, result)
            return result;
        } else {
            await operationLocMasterUpload(req)
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

/************************Operation for Pumori Product Location Master *******************************/
const operationLocMasterUpload = async function (req) {
    try {
        let nDays = req.data.Days;
        let sFactoryNumber = req.data.FactoryNumber;
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
        let output = await _callHdbProcedure("pumoriLocationProduct", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
        let result = output.outputScalar
        var oResponseData = _getBulkUploadResponse(result.TOTAL_INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS );
        return oResponseData;
    }
    catch (error) {
        req.error({ code: ERROR_STATUS_CODE, message: error.message });
    }
}

module.exports = {
    handleAsyncJobLocMasterUpload
}



srv/pumoriproduct/pumoriproduct-helper.js




const { doUpdateStatus } = require('../jobscheduler/scheduler');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('../_i18n/i18n');
const { _callHdbProcedure, _getBulkUploadResponse } = require('../commonhelper');
const { ERROR_STATUS_CODE } = require('../constants');

/************************Handle job for Pumori Product Master *******************************/
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

/***********************Operation for Pumori Product Master *******************************/
const operationMasterUpload = async function (req) {
    try {
        let nDays = req.data.Days;
        let sFactoryNumber = req.data.FactoryNumber;
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
        let output = await _callHdbProcedure("pumoriProduct", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
        let result = output.outputScalar
        var oResponseData = _getBulkUploadResponse(result.TOTAL_INSERTED_ROWS, result.TOTAL_UPDATED_ROWS, result.TOTAL_DELETED_ROWS);
        return oResponseData;
    }
    catch (error) {
        req.error({ code: ERROR_STATUS_CODE, message: error.message });
    }
}


module.exports = {
    handleAsyncJob
}



srv/pumoritlane/pumoritlane-helper.js



const { doUpdateStatus } = require('../jobscheduler/scheduler');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('../_i18n/i18n');
const { _callHdbProcedure, _getBulkUploadResponse } = require('../commonhelper');
const { ERROR_STATUS_CODE } = require('../constants');

/************************Handle job for Pumori Product Tlane *******************************/
const handleAsyncJobTranslane = async function (headers, req) {
    try {
        let result = await operationTranslane(req)
        if ((typeof result !== 'undefined') && (result !== null)) {
            await doUpdateStatus(headers, true, result)
            return result;
        } else {
            await operationTranslane(req)
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

/************************Operation for Pumori Product Tlane *******************************/
const operationTranslane = async function (req) {
    try {
        let nDays = req.data.Days;
        let sFactoryNumber = req.data.FactoryNumber;
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
        let output = await _callHdbProcedure("pumoriTlane", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
        let result = output.outputScalar
        var oResponseData = _getBulkUploadResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS );
        return oResponseData;
    }
    catch (error) {
        req.error({ code: ERROR_STATUS_CODE, message: error.message });
    }
}

module.exports = {
    handleAsyncJobTranslane
}



srv/pumoriuom/pumoriuom-helper.js


const { doUpdateStatus } = require('../jobscheduler/scheduler');
const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('../_i18n/i18n');
const { _callHdbProcedure, _getBulkUploadResponse } = require('../commonhelper');
const { ERROR_STATUS_CODE } = require('../constants');

/************************Handle job for Pumori Product UOM *******************************/
const handleAsyncJobUOM = async function (headers, req) {
    try {
        let result = await operationUOM(req)
        if ((typeof result !== 'undefined') && (result !== null)) {
            await doUpdateStatus(headers, true, result)
            return result;
        } else {
            await operationUOM(req)
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

/************************operation for Pumori Product UOM *******************************/
const operationUOM = async function (req) {
    try {

        let nDays = req.data.Days;
        let sFactoryNumber = req.data.FactoryNumber;
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
        let output = await _callHdbProcedure("pumoripsUOM", { "DELTA_INPUT": aInputToProcedure, "DAYSCOUNT": dayscount });
        let result = output.outputScalar
        var oResponseData = _getBulkUploadResponse(result.INSERTED_ROWS, result.UPDATED_ROWS, result.DELETED_ROWS);
        return oResponseData;
    }
    catch (error) {
        req.error({ code: ERROR_STATUS_CODE, message: error.message });
    }
}

module.exports = {
    handleAsyncJobUOM
}