sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onClickCustomActionWithResponse: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
