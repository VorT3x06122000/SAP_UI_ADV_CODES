const cds = require ('@sap/cds');
const Request = require('@sap/cds/lib/req/request');

let selectedDataUI = [];

module.exports = async srv =>{
    srv.on('testAction', async (req) => {
      return "Test Service called";
    });

    srv.on('testActionWithUserInput', async (req) => {
      var data = req.data;
      return data;
    });


    //get call
    srv.on('READ', 'EditDataSet' ,async (request)=>{
      return selectedDataUI;
    });
    srv.on('CREATE', 'EditDataSet' ,async (request)=>{
      return selectedDataUI;
    });
    srv.on('selectedData', async (request)=>{
      selectedDataUI=request.data.payload;
      return selectedDataUI;
    });
}