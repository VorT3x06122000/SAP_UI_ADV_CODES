using {pumorips.pumoriconfig as pumoriconfig} from '../db/pumoripsconfig-model';

service PumoriConfigService @(requires: 'authenticated-user'){
    entity PumoriColumnPriorityView  as projection on pumoriconfig.PumoriColumnPriorityView;
    entity entityView                as projection on pumoriconfig.entityView;
    entity FactoryStatusDashboard    as projection on pumoriconfig.FactoryStatusDashboard;
    entity fileNameValHelp           as projection on pumoriconfig.fileNameValHelp;
    entity processTimeValHelp        as projection on pumoriconfig.processTimeValHelp;
    entity statusValHelp             as projection on pumoriconfig.statusValHelp;
    entity prococessingValHelp       as projection on pumoriconfig.prococessingValHelp;
    entity interfaceValueHelp        as projection on pumoriconfig.interfaceValueHelp;
    entity factoryIdValueHelp        as projection on pumoriconfig.factoryIdValueHelp;
    entity dateValueHelp             as projection on pumoriconfig.dateValueHelp;
    entity FactoryStatusResponseView as projection on pumoriconfig.FactoryStatusResponseView;

    type Configinput : {
        entityName : String(50);
        column     : String(50);
        priority   : String(10);
    }

      //success response type for bulkupload
    type Success      : {
        totalRecords   : String;
        updated        : String;
        created        : String;
        deleted        : String;
        duplicate      : String;
        uomdeleted     : String;
        prodlocdeleted : String;
        tlanedeleted   : String;
    }
     //error response type for bulkupload
    type Error        : {
        errorFields : String;
    }

    //response type for bulkupload
    type ResponseType : {
        success : Success;
        error   : Error;
    }

    action config_update(UserEmail : String, PriorityUpdateData : array of Configinput) returns String;
    action StatusResponseData(FileName : String)                                      returns array of FactoryStatusResponseView;
}