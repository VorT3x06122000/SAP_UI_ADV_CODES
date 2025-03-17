using pumorips.factorylocation as FacLoc from '../db/pumoripsfactorylocationmaster-model';


service FactoryLocationService @(requires: 'authenticated-user'){
    entity FactoryLocations           as projection on FacLoc.FactoryLocations;
    entity FactoryLocationView@(restrict: [{
        grant: ['*'],
        to   : [
            'Display',
            'Edit'
        ]
    }])                               as projection on FacLoc.FactoryLocationView;
    entity CountryValueHelp           as projection on FacLoc.CountryValueHelp;
    entity FactoryNumberValueHelp     as projection on FacLoc.FactoryNumberValueHelp;
    entity LocationIDValueHelp        as projection on FacLoc.LocationIDValueHelp;
    entity LocationTypeValues         as projection on FacLoc.LocationTypeValues;
    entity CityValueHelp              as projection on FacLoc.CityValueHelp;
    entity CountyCodeValueHelp        as projection on FacLoc.CountyCodeValueHelp;
    entity LocAddr1ValueHelp          as projection on FacLoc.LocAddr1ValueHelp;
    entity LocAddr2ValueHelp          as projection on FacLoc.LocAddr2ValueHelp;
    entity LocCont1ValueHelp          as projection on FacLoc.LocCont1ValueHelp;
    entity LocCont2ValueHelp          as projection on FacLoc.LocCont2ValueHelp;
    entity LocEmail1ValueHelp         as projection on FacLoc.LocEmail1ValueHelp;
    entity LocEmail2ValueHelp         as projection on FacLoc.LocEmail2ValueHelp;
    entity LocRegionValueHelp         as projection on FacLoc.LocRegionValueHelp;
    entity StateValueHelp             as projection on FacLoc.StateValueHelp;
    entity ZipcodeValueHelp             as projection on FacLoc.ZipcodeValueHelp;
    entity FaclocTransformation       as projection on FacLoc.FaclocTransformation;
    entity LocationTransformationView as projection on FacLoc.LocationTransformationView;
    entity LocationDescrValueHelp     as projection on FacLoc.LocationDescrValueHelp;
    entity VendorIDValueHelp          as projection on FacLoc.VendorIDValueHelp;
    entity VendorNameValueHelp        as projection on FacLoc.VendorNameValueHelp;
    entity VendorGrpValueHelp         as projection on FacLoc.VendorGrpValueHelp;
    entity FactoryTransValueHelp      as projection on FacLoc.FactoryTransValueHelp;
    entity FactoryStatusResponseView  as projection on FacLoc.FactoryStatusResponseView;
    
    type FacLocInput  : {
        factoryNumber        : String(20);
        locId                : String(20);
        locDescr             : String(100);
        locType              : String(1);
        zplantType           : String(40);
        locRegion            : String(20);
        locationAddress1     : String(200);
        locationAddress2     : String(80);
        city                 : String(35);
        state                : String(35);
        country              : String(40);
        countryCode          : String(3);
        zipcode              : String(10);
        locationContact1Name : String(80);
        locationEmail1       : String(80);
        locationContact2Name : String(80);
        locationEmail2       : String(80);
        markedforDeletion    : String(1);
        custAttr1            : String(10);
        custAttr2            : String(10);
        custAttr3            : String(10);
        custAttr4            : String;
        custAttr5            : String(20);
        custAttr6            : String(20);
        custAttr7            : String;
        custAttr8            : String;
        custAttr9            : String;
        custAttr10           : String(40);
    }

    //success response type for bulkupload
    type Success      : {
        totalRecords : String;
        created      : String;
        updated      : String;
        deleted      : String;
        duplicate    : String;
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
    
    type FacLocDelInput {
        factoryNumber : String(20);
        locId         : String(20);
        locType       : String(1);
    }

    action FactoryTransformUpload(Days : Integer, FactoryNumber : String)                                returns String;
    action FacLocMasterUpload(UserEmail : String, PostingData : array of FacLocInput, FileName : String) returns array of ResponseType;
    action FacLocDeletionData(UserEmail : String, FacLocDelData : array of FacLocDelInput)               returns String;
    function SecurityAction()                                                                            returns String;
}