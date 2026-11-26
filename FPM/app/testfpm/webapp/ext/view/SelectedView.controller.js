sap.ui.define(
    [
        'sap/fe/core/PageController'
    ],
    function(PageController) {
        'use strict';

        return PageController.extend('testfpm.ext.view.SelectedView', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf testfpm.ext.view.SelectedView
             */
             onInit: function () {
                 PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller
             },
             onSave: async function() {   
                var oModelv2 = this.getView().getModel("v2");       
                // MessageBox.show("Custom Action Pressed");
                let aData = this.aData;
                oModelv2.setProperty("/SelectedRows", aData);
                var sActionURL = '/cat-service/selectedData';
                var payload = {
                    payload: aData
                };
                let response = await oModelv2.create("/selectedData", payload, {
                    success: function(oResponse){
                        console.log("Success:", oResponse);
                        return response;
                    },
                    error: function(oError){
                        console.error("Error:", oError);
                    }
                });
                // var oRouter = this.getExtensionAPI().getRouting();
                // oRouter.navigateToRoute("BooksSelectedViewPage");
            }

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf testfpm.ext.view.SelectedView
             */
            //  onBeforeRendering: function() {
            //
            //  },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf testfpm.ext.view.SelectedView
             */
            //  onAfterRendering: function() {
            //
            //  },

            /**
             * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
             * @memberOf testfpm.ext.view.SelectedView
             */
            //  onExit: function() {
            //
            //  }
        });
    }
);
