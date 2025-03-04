const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const cds = require('@sap/cds');
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
/*********************** Response Creation Method ***********************/
async function _getBulkUploadResponse(TableName, nInserted, nUpdated, nDeleted, nDeletedExtra, nDeletedProdLoc, nDeletedTLane) {
    let oResponse = {};
    //Response creation for success
    if (nInserted > 0 || nUpdated > 0 || nDeleted > 0 || nDeletedExtra > 0 || nDeletedProdLoc > 0 || nDeletedTLane > 0) {
        oResponse['success'] = {};

        if (nInserted > 0)
            oResponse['success'].created = nInserted + bundle.getText('rowscreated');
        if (nUpdated > 0)
            oResponse['success'].updated = nUpdated + bundle.getText('rowsupdated');
        if (nDeleted && nDeleted > 0)
            oResponse['success'].deleted = nDeleted + bundle.getText('rowsdeleted');
        if (nDeletedExtra && nDeletedExtra > 0) {
            if (TableName == "PumProd")
                oResponse['success'].deletedUOM = nDeletedExtra + bundle.getText('rowsdeleted');
            else if (TableName == "PumProdLoc" || TableName == "PumTlane")
                oResponse['success'].deletedNotExistInLoc = nDeletedExtra + bundle.getText('rowsdeleted');
        }
        if (nDeletedProdLoc && nDeletedProdLoc > 0)
            oResponse['success'].deletedProdLocRows = nDeletedProdLoc + bundle.getText('rowsdeleted');
        if (nDeletedTLane && nDeletedTLane > 0)
            oResponse['success'].deletedTLaneRows = nDeletedTLane + bundle.getText('rowsdeleted');
    }
    return oResponse;
};

/************************Re-Usable Functions for SP*******************************/
// This reusable function is used to make procedure call
let _callHdbProcedure = async function (sProcedureName, oInputParams) {

    //call procedure
    const db = await cds.connect.to('db');
    const dbConn = new dbclass(await dbclass.createConnection(db.options.credentials));
    const sp = await dbConn.loadProcedurePromisified(hdbext, null, sProcedureName);
    var oDbProcedureRet = dbConn.callProcedurePromisified(sp, oInputParams);
    return oDbProcedureRet;
}

/*************************************UPLOAD HISTORY LOGIC UH*********************************************************************/
module.exports = {
    _getBulkUploadResponse,
    _callHdbProcedure
}