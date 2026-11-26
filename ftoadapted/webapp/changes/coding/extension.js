sap.ui.define(
    [
        'sap/ui/core/mvc/ControllerExtension',
        'sap/m/MessageBox'
        // ,'sap/ui/core/mvc/OverrideExecution'
    ],
    function (
        ControllerExtension,
        MessageBox
        // ,OverrideExecution
    ) {
        'use strict';
        return ControllerExtension.extend("customer.ftoadapted.extension", {
            // metadata: {
            // 	// extension can declare the public methods
            // 	// in general methods that start with "_" are private
            // 	methods: {
            // 		publicMethod: {
            // 			public: true /*default*/ ,
            // 			final: false /*default*/ ,
            // 			overrideExecution: OverrideExecution.Instead /*default*/
            // 		},
            // 		finalPublicMethod: {
            // 			final: true
            // 		},
            // 		onMyHook: {
            // 			public: true /*default*/ ,
            // 			final: false /*default*/ ,
            // 			overrideExecution: OverrideExecution.After
            // 		},
            // 		couldBePrivate: {
            // 			public: false
            // 		}
            // 	}
            // },
            // // adding a private method, only accessible from this controller extension
            // _privateMethod: function() {},
            // // adding a public method, might be called from or overridden by other controller extensions as well
            // publicMethod: function() {},
            // // adding final public method, might be called from, but not overridden by other controller extensions as well
            // finalPublicMethod: function() {},
            // // adding a hook method, might be called by or overridden from other controller extensions
            // // override these method does not replace the implementation, but executes after the original method
            // onMyHook: function() {},
            // // method public per default, but made private via metadata
            // couldBePrivate: function() {},
            // // this section allows to extend lifecycle hooks or override public methods of the base controller
            override: {
            	/**
            	 * Called when a controller is instantiated and its View controls (if available) are already created.
            	 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
            	 * @memberOf customer.ftoadapted.extension
            	 */
            	onInit: function() {
                    this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").attachSelectionChange(this.onItemSelect, this);
            	},

                /**
                 * custom event handler that executes logic when a specific subsection of the Object Page is entered (i.e., becomes visible or active).
                 */
                onSubSectionEnteredExtension: function (oEvent) {

                    // Check if the entered subsection is the classification component container
                    if (oEvent.sId === "i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::SubSection") {
                        // this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::Table").setMode(MultiSelect);
                        // this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").setSelectionMode(true);
                        // this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").setMultiSelectMode("ClearAll");
                        this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").setMode(sap.m.ListMode.MultiSelect);
                    }
                },
                
            	// /**
            	//  * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
            	//  * (NOT before the first rendering! onInit() is used for that one!).
            	//  * @memberOf customer.ftoadapted.extension
            	//  */
            	// onBeforeRendering: function() {
            	// },
            	// /**
            	//  * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
            	//  * This hook is the same one that SAPUI5 controls get after being rendered.
            	//  * @memberOf customer.ftoadapted.extension
            	//  */
            	// onAfterRendering: function() {
            	// },
            	// /**
            	//  * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
            	//  * @memberOf customer.ftoadapted.extension
            	//  */
            	// onExit: function() {
            	// },
            	// // override public method of the base controller
            	// basePublicMethod: function() {
            	// }
            },


            /**
             * Handles selection change in the responsive table.
             * Enables the action button if at least one item is selected, disables it otherwise.
             */
            onItemSelect: function (oEvent) {
                // Retrieve selected items from the responsive table
                var selIndices = this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").getSelectedItems();

                // Check if any items are selected
                if (selIndices.length > 0) {
                    // Enable the custom button when at least one item is selected
                    this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--customer.ftoadapted.btn-b4ae1e74").setEnabled(true);
                } else {
                    // Disable the custom button when no items are selected
                    this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--customer.ftoadapted.btn-b4ae1e74").setEnabled(false);
                }
            },

            onCustomAction : function(){
                let aSelectedItems = this.base.byId("i2d.eam.technicalobject.manages1::sap.suite.ui.generic.template.ObjectPage.view.Details::C_ObjPgTechnicalObject--TechObjMaintenanceOrderFacet::responsiveTable").getSelectedItems();
                var aOrderIds = [];
                aSelectedItems.forEach(function (oItem) {
                    var oRowData = oItem.getBindingContext().getObject();
                    aOrderIds.push(oRowData.MaintenanceOrder); // replace with actual field
                });
                sap.m.MessageBox.information(aOrderIds.join(", "));
            }
        });
    }
);
