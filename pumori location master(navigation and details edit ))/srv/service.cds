using pumorips.pumorilocation as PumoriLoc from '../db/pumoripspumorilocation-model';

service PumoriLocationService @(requires: 'authenticated-user'){
    entity PumoriLocations       as projection on PumoriLoc.PumoriLocations;

    entity PumoriLocationsView @(restrict: [{
        grant: ['*'],
        to   : [
            'WithView',
            'WithEdit'
        ]
    }])                           as projection on PumoriLoc.PumoriLocationsView;
    
    entity LocIdValueHelp        as projection on PumoriLoc.LocIdValueHelp;
    entity VendorGrpValueHelp    as projection on PumoriLoc.VendorGrpValueHelp;
    entity VendorGrpNmeValueHelp as projection on PumoriLoc.VendorGrpNmeValueHelp;
    entity plantTypeValueHelp    as projection on PumoriLoc.plantTypeValueHelp;
    entity zplantTypeValueHelp   as projection on PumoriLoc.zplantTypeValueHelp;
    entity locRegionValueHelp    as projection on PumoriLoc.locRegionValueHelp;
    entity locationAddress1ValueHelp as projection on PumoriLoc.locationAddress1ValueHelp;
    entity locationAddress2ValueHelp as projection on PumoriLoc.locationAddress2ValueHelp;
    entity cityValueHelp         as projection on PumoriLoc.cityValueHelp;
    entity stateValueHelp        as projection on PumoriLoc.stateValueHelp;
    entity countryValueHelp      as projection on PumoriLoc.countryValueHelp;
    entity countryCodeValueHelp as projection on PumoriLoc.countryCodeValueHelp;
    entity zipcodeValueHelp     as projection on PumoriLoc.zipcodeValueHelp;
    entity locationContact1NameValueHelp as projection on PumoriLoc.locationContact1NameValueHelp;
    entity locationEmail1ValueHelp as projection on PumoriLoc.locationEmail1ValueHelp;
    entity locationContact2NameValueHelp as projection on PumoriLoc.locationContact2NameValueHelp;
    entity locationEmail2ValueHelp as projection on PumoriLoc.locationEmail2ValueHelp;
    entity locationContact3NameValueHelp as projection on PumoriLoc.locationContact3NameValueHelp;
    entity locationContact4NameValueHelp as projection on PumoriLoc.locationContact4NameValueHelp;
    entity StreetHouseNumberValueHelp as projection on PumoriLoc.StreetHouseNumberValueHelp;
    entity AddressTimeZoneValueHelp as projection on PumoriLoc.AddressTimeZoneValueHelp;
    entity FirstTelephoneNumberValueHelp as projection on PumoriLoc.FirstTelephoneNumberValueHelp;
    entity FactoryCalendarValueHelp as projection on PumoriLoc.FactoryCalendarValueHelp;
    entity VendorCreditAccountNumberValueHelp as projection on PumoriLoc.VendorCreditAccountNumberValueHelp;
    entity CustomerNumberValueHelp as projection on PumoriLoc.CustomerNumberValueHelp;
    entity PostalCodeValueHelp as projection on PumoriLoc.PostalCodeValueHelp;
    entity POBoxPostalCodeValueHelp as projection on PumoriLoc.POBoxPostalCodeValueHelp;
    entity BusinessUnitValueHelp as projection on PumoriLoc.BusinessUnitValueHelp;
    entity CustomerClassificationValueHelp as projection on PumoriLoc.CustomerClassificationValueHelp;
    entity DummyforIntegrationValueHelp as projection on PumoriLoc.DummyforIntegrationValueHelp;
    entity ETAETDValueHelp as projection on PumoriLoc.ETAETDValueHelp;
    entity PlantValueHelp as projection on PumoriLoc.PlantValueHelp;
    entity PlanningAreaValueHelp as projection on PumoriLoc.PlanningAreaValueHelp;
    entity OpsiIdResponse as projection on PumoriLoc.OpsiIdResponse;

    type Success      : {
        created : String;
        updated : String;
        deleted : String;
    }

    type ConsolidatedidInput{
        locId       : String(20);
        mainPlant   : String(30);
    }

    //response type for bulkupload
    type ResponseType : {
        success : Success;
    }


    type OpsiResponse :{
        locId       : String(20);
        opsiId   : String(30);
    }

    action PumoriLocUpload(Days : Integer, FactoryNumber : String) returns String;
    action UpdatePumoriLocation(LocData : LargeString)             returns String;
    action ConsolidatedID(UserEmail : String, PostingData : array of ConsolidatedidInput)                    returns String;
    function SecurityAction()                                      returns String;
    function MulesoftAPIJobSchedular() returns String;
    function opsiIDItem(locId : String,) returns array of OpsiResponse;
}