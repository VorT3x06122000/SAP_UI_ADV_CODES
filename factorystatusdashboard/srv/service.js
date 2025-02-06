const cds=require('@sap/cds');
const { error } = require('@sap/hdi-deploy/lib/logger');
const TextBundle=require('@sap/textbundle').TextBundle;
const bundle=new TextBundle('./_i18n/i18n');
const {PumoriColumnPriority, FactoryStatusResponseView} =cds.entities('pumorips.pumoriconfig');
const { EntityMapping } = require('./constant');

module.exports= cds.service.impl(async function(){
    this.on('config_update',async(req) =>{
         try{
            let msgLog=[];
            let oData=req.data;
            let aPayload=oData.PriorityUpdateData;
            const userEmail = oData.UserEmail;
            const tx=cds.transaction(req);
            let aUpdateItems = [];
            let isError = false;
            for(let item of aPayload) {
                aUpdateItems.push(
                UPDATE.entity(PumoriColumnPriority).
                data({
                    priority: item.priority == 'X' ? 'MS4' : 'Factory',
                    modifiedBy: userEmail
                }).where({ entity: EntityMapping[item.entityName], column: item.column}));
            }
            try{
                await tx.run(aUpdateItems);
                msgLog.push({ "type": "Success", "message": bundle.getText("priotiyUpdated") });
                return JSON.stringify(msgLog);
            } catch (err) {
                return req.error({"status": 400 , "message" : err.message});
            }
         }
         catch(error){
            console.log(error);
         }
    });

     /***********************StatusResponseData Service ************************/
     this.on('StatusResponseData', async (req) => {
        try {
            let oData = req.data;
            const aFilename = oData.FileName;
            const tx = cds.transaction(req);
            let response = [];
            let existingData = await tx.run(SELECT.from(FactoryStatusResponseView).where({ fileName: aFilename })).catch((error) => {
                req.error({ "type": "Error", "message": error.message });
            });
            response = (existingData.length > 0)?existingData:existingData.message = "Data Not Available";
            return existingData;
        }
        catch (error) {
            return req.error(error);
        }
    });
});