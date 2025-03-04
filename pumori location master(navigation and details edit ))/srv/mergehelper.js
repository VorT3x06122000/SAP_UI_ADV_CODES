const TextBundle = require('@sap/textbundle').TextBundle;
const bundle = new TextBundle('./_i18n/i18n');
const cds = require('@sap/cds');
const hdbext = require("@sap/hdbext");
const dbclass = require("sap-hdbext-promisfied");
/*********************** Response Creation Method ***********************/
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



module.exports = {
    _getResponse
}