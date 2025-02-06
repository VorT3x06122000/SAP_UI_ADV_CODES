//-----------------------------------------------------------------------------------*
//Confidential and Proprietary
//Copyright 2021, HP
//All Rights Reserved
//-----------------------------------------------------------------------------------*
// Application Name :    Display Pumori Product Master
// WRICEF No        :
// Release          :
// Author           :    Chowdhary,Mamtha
// Date             :    12.02.2024
// Description      :    Display Pumori Manage Config
//-----------------------------------------------------------------------------------*
//Descriptions: Used for data modelling
//-----------------------------------------------------------------------------------*
//Change Log:
//    Date      |   Author      |   Defect/Incident     |   Change Description
//-----------------------------------------------------------------------------------*/
namespace pumorips.pumoriconfig;

using {managed} from '@sap/cds/common';

entity PumoriMot : managed {
    key modeofTransport     : String(10);
    key languageKey         : String(3);
        modeoftransportDesc : String(40);
}

entity LocationTypes {
    key locType     : String(1);
        locTypeText : String(35);

}

entity PumoriConfig {
    key businessGroup : String(5);
    key appName       : String(20);
    key param1        : String(25);
        param2        : String(15);
        value1        : String(15);
        value2        : String(15);
}

entity UploadHistory  {
    key appName   : String(30);
    key processId : String(25);
        status    : String(30);
        records   : String(100);
        createdAt      : Timestamp;
        createdBy      : String(255);
        modifiedAt     : Timestamp;
        modifiedBy     : String(255);
}

entity UploadResponse {
    key appName        : String(30);
    key processId      : String(25);
    key factoryNumber  : String(40);
    key prodId         : String(40);
    key zmpaPartno     : String(40);
    key locId          : String(40);
    key uomAlt         : String(40);
    key locFr          : String(40);
    key locfrType      : String(40);
    key locTo          : String(40);
    key loctoType      : String(40);
    key locType        : String(40);
    key alternativeBom : String(2);
    key levelNo        : String(10);
    key mpnChildPn     : String(40);
    key bomVersion     : String(10);
        errordetails   : String;
        createdAt      : Timestamp;
        createdBy      : String(255);
        modifiedAt     : Timestamp;
        modifiedBy     : String(255);
}

entity PumoriColumnPriority : managed {
    key entity   : String(50);
    key column   : String(50);
        priority : String(10);
}

entity FactoryStatusDashboard : managed {
    key interface         : String(20);
    key factoryId         : String(20);
    key fileName          : String(50);
        date              : Date;
        processTime       : String(10);
        status            : String(10);
        records           : Integer;
        successfulRecords : Integer;
        errorRecords      : Integer;
        prococessing      : String(20);
    key uploadedtime      : Timestamp;

}

entity FactoryStatusResponse : managed {
    key interface      : String(20);
    key factoryId      : String(20);
    key fileName       : String(50);
    key uploadedtime   : Timestamp;
    key factoryNumber  : String(40);
    key prodId         : String(40);
    key zmpaPartno     : String(40);
    key locId          : String(40);
    key uomAlt         : String(40);
    key locFr          : String(40);
    key locfrType      : String(40);
    key locTo          : String(40);
    key loctoType      : String(40);
    key locType        : String(40);
    key alternativeBom : String(2);
    key levelNo        : String(10);
    key mpnChildPn     : String(40);
    key bomVersion     : String(10);
        errordetails   : String;
}

view PumoriColumnPriorityView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key case
                when
                    PumoriColumnPriority.entity = 'Location'
                then
                    'Location'
                when
                    PumoriColumnPriority.entity = 'Product'
                then
                    'Product'
                when
                    PumoriColumnPriority.entity = 'ProdLoc'
                then
                    'Product Location'
                when
                    PumoriColumnPriority.entity = 'Translane'
                then
                    'Transportation Lane'
                when
                    PumoriColumnPriority.entity = 'UOM'
                then
                    'Unit of Measure'
            end as entityName : String(50),
        key column            : String(50),
            priority          : String(10)
    from PumoriColumnPriority;

view entityView as select distinct key entityName from PumoriColumnPriorityView;


view interfaceValueHelp as
    select from FactoryStatusDashboard distinct {
        key interface
    };

view factoryIdValueHelp as
    select from FactoryStatusDashboard distinct {
        key factoryId
    };

view dateValueHelp as
    select from FactoryStatusDashboard distinct {
        key date
    };

view fileNameValHelp     as select distinct key fileName     from FactoryStatusDashboard;
view processTimeValHelp  as select distinct key processTime  from FactoryStatusDashboard;
view statusValHelp       as select distinct key status       from FactoryStatusDashboard;
view prococessingValHelp as select distinct key prococessing from FactoryStatusDashboard;


/* FactoryStatusResponse View*/
view FactoryStatusResponseView as
    select
        key interface,
        key factoryId,
        key fileName,
        key uploadedtime,
        key factoryNumber,
        key prodId,
        key zmpaPartno,
        key locId,
        key uomAlt,
        key locFr,
        key locfrType,
        key locTo,
        key loctoType,
        key locType,
        key alternativeBom,
        key levelNo,
        key mpnChildPn,
        key bomVersion,
            modifiedAt,
            modifiedBy,
            errordetails
    from FactoryStatusResponse;
    