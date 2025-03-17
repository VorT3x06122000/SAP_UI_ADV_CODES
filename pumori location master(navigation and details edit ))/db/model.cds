namespace pumorips.pumorilocation;

using {managed} from '@sap/cds/common';


/**
 * _********SCP tables********_\*\*
 */

/* PumoriLocations table Merge table - Location output table */
entity PumoriLocations : managed {
        // factoryNumber        : String(20);
    key locId                : String(20);
        locDescr             : String(100);
    key locType              : String(1);
        Keeperflag           : String(1);
        plantType            : String(3);
        zplantType           : String(40);
        locRegion            : String(20);
        locationAddress1     : String(200);
        locationAddress2     : String(80);
        city                 : String(35);
        state                : String(35);
        country              : String(40);
        countryCode          : String(2);
        zipcode              : String(10);
        locationContact1Name : String(80);
        locationEmail1       : String(80);
        locationContact2Name : String(80);
        locationEmail2       : String(80);
        locationContact3Name : String(80);
        locationContact4Name : String(80);
        STRAS                : String(35);
        TIME_ZONE            : String(6);
        TELF1                : String(16);
        PLIFZ                : Decimal(3);
        vendorGroup          : String(20);
        FABKL                : String(32);
        LIFNR                : String(10);
        KUNNR                : String(10);
        ACTIVE_FLAG          : String(1);
        PSTLZ                : String(10);
        PSTL2                : String(10);
        BUSINESS_UNIT        : String(2);
        KUKLA                : String(2);
        longitude            : Decimal(17);
        latitude             : Decimal(17);
        DUMMY_TS_LOC         : String(1);
        ETA_ETD              : String(10);
        WERKS                : String(4);
        Dabnode_Flag         : String(1);
        PA_Name              : String(4);
        markedforDeletion    : String(1);
        custAttr1            : String(10);
        custAttr2            : String(10);
        custAttr3            : String(10);
        custAttr4            : Date;
        custAttr5            : String(20);
        custAttr6            : String(20);
        custAttr7            : Integer;
        custAttr8            : Decimal(13, 3);
        custAttr9            : Decimal(5, 2);
        custAttr10           : String(40);
        mainPlant            : String(30);
        opsiId               : String(10);
}

/*Tlane Transformation Table*/
@cds.persistence.exists
entity syn_TlaneTransformation {
    key pumoriPN          : String(40);
    key locFr             : String(20);
        locfrType         : String(1);
    key locTo             : String(20);
        loctoType         : String(1);
        leadTime          : Integer;
        zQuota            : Integer;
        markedforDeletion : String(1);
    key validFrom         : Date;
    key validTo           : Date;
}

/*FactoryLocations table data*/
@cds.persistence.exists
entity syn_FactoryLocations {
    key factoryNumber        : String(20);
    key locId                : String(20);
        locDescr             : String(100);
    key locType              : String(1);
        zplantType           : String(40);
        locRegion            : String(20);
        locationAddress1     : String(200);
        locationAddress2     : String(80);
        city                 : String(35);
        state                : String(35);
        zcountry             : String(40);
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
        custAttr4            : Date;
        custAttr5            : String(20);
        custAttr6            : String(20);
        custAttr7            : Integer;
        custAttr8            : Decimal(13, 3);
        custAttr9            : Decimal(5, 2);
        custAttr10           : String(40);
        modifiedAt           : Date;
}

/*Pumori Config table data*/
@cds.persistence.exists
entity syn_PumoriConfig {
    key businessGroup : String(5);
    key appName       : String(20);
    key param1        : String(25);
        param2        : String(15);
        value1        : String(15);
        value2        : String(15);
}

/* Location Transformation table */
@cds.persistence.exists
entity FaclocTransformation : managed {
    key Factory               : String(20);
    key VendorId              : String(20);
    key locType               : String(1)
        @assert.notNull
        @assert.range enum {
            PlantORDistributioncenter = 'P';
            Supplier                  = 'V';
        };
        VendorName           : String(100);
        VendorGroup          : String(20);
        Keeperflag           : String(1);
        markedforDeletion    : String(1);
}

entity OpsiIdResponse {
        matchScore: String(3);
        name: String(100);
    key opsiId: String(10);
        country: String(100);
        countryCode:String(100);
        city: String(35);
        postalCode: String(10);
        street1: String(200);
        state: String(35);
    key locId: String(20);
        dunsNumber: String(100);
}

/*PumoriLocations View */
view PumoriLocationsView as
    select
        a.createdAt,
        a.createdBy,
        a.modifiedAt,
        a.modifiedBy,
    key a.locId,
        a.locDescr,
    key a.locType,
        case a.locType
            when
                'P'
            then
                'P(Plant or Distribution center)'
            when
                'V'
            then
                'V(Supplier)'
        end as locTypeText   : String(20),
        Keeperflag           : String(1),
        plantType,
        case a.plantType
            when
                'PL'
            then
                'PL(Production Plant)'
            when
                'DC'
            then
                'DC(Distribution Center)'
        end as plantTypeText : String(20),
        a.zplantType,
        a.locRegion,
        a.locationAddress1,
        a.locationAddress2,
        a.city,
        a.state,
        a.country,
        a.countryCode,
        a.zipcode,
        a.locationContact1Name,
        a.locationEmail1,
        a.locationContact2Name,
        a.locationEmail2,
        a.locationContact3Name,
        locationContact4Name,
        STRAS,
        TIME_ZONE,
        TELF1,
        PLIFZ,
        vendorGroup,
        FABKL,
        LIFNR,
        KUNNR,
        ACTIVE_FLAG,
        PSTLZ,
        PSTL2,
        BUSINESS_UNIT,
        KUKLA,
        longitude,
        latitude,
        DUMMY_TS_LOC,
        ETA_ETD,
        WERKS,
        Dabnode_Flag,
        PA_Name,
        markedforDeletion,
        custAttr1,
        custAttr2,
        custAttr3,
        custAttr4,
        custAttr5,
        custAttr6,
        custAttr7,
        custAttr8,
        custAttr9,
        custAttr10,
        mainPlant,
        a.opsiId,
        b.dunsNumber,
        case when a.opsiId = '' OR a.opsiId is null
            then false
            else true
            end as marked: Boolean
        from PumoriLocations as a
        left outer join OpsiIdResponse as b
        on b.locId = a.locId 
        and b.opsiId = a.opsiId;


/*LocIdValueHelp view */
view LocIdValueHelp as select distinct key locId from PumoriLocationsView;
/*VendorGrpValueHelp view */
view VendorGrpValueHelp as select distinct key vendorGroup from PumoriLocationsView;

/*VendorGrpNmeValueHelp view */
view VendorGrpNmeValueHelp as select distinct key locDescr from PumoriLocationsView;

view plantTypeValueHelp as select distinct key plantType from PumoriLocationsView;


view zplantTypeValueHelp as select distinct key zplantType from PumoriLocationsView;
view locRegionValueHelp as select distinct key locRegion from PumoriLocationsView where locRegion!='' and locRegion is not null;
view locationAddress1ValueHelp as select distinct key locationAddress1 from PumoriLocationsView where locationAddress1!='' and locationAddress1 is not null;
view locationAddress2ValueHelp as select distinct key locationAddress2 from PumoriLocationsView where locationAddress2!='' and locationAddress2 is not null;
view cityValueHelp as select distinct key city from PumoriLocationsView where city!='' and city is not null;
view stateValueHelp as select distinct key state from PumoriLocationsView where state!='' and state is not null;
view countryValueHelp as select distinct key country from PumoriLocationsView where country!='' and country is not null;
view countryCodeValueHelp as select distinct key countryCode from PumoriLocationsView where countryCode!='' and countryCode is not null;
view zipcodeValueHelp as select distinct key zipcode from PumoriLocationsView where zipcode!='' and zipcode is not null;
view locationContact1NameValueHelp as select distinct key locationContact1Name from PumoriLocationsView where locationContact1Name!='' and locationContact1Name is not null;
view locationEmail1ValueHelp as select distinct key locationEmail1 from PumoriLocationsView where locationEmail1!='' and locationEmail1 is not null;
view locationContact2NameValueHelp as select distinct key locationContact2Name from PumoriLocationsView where locationContact2Name!='' and locationContact2Name is not null;
view locationEmail2ValueHelp as select distinct key locationEmail2 from PumoriLocationsView where locationEmail2!='' and locationEmail2 is not null;
view locationContact3NameValueHelp as select distinct key locationContact3Name from PumoriLocationsView where locationContact3Name!='' and locationContact3Name is not null;
view locationContact4NameValueHelp as select distinct key locationContact4Name from PumoriLocationsView where locationContact4Name!='' and locationContact4Name is not null;
view StreetHouseNumberValueHelp as select distinct key STRAS from PumoriLocationsView where STRAS!='' and STRAS is not null;
view AddressTimeZoneValueHelp as select distinct key TIME_ZONE from PumoriLocationsView where TIME_ZONE!='' and TIME_ZONE is not null;
view FirstTelephoneNumberValueHelp as select distinct key TELF1 from PumoriLocationsView where TELF1!='' and TELF1 is not null;
view FactoryCalendarValueHelp as select distinct key FABKL from PumoriLocationsView where FABKL!='' and FABKL is not null;
view VendorCreditAccountNumberValueHelp as select distinct key LIFNR from PumoriLocationsView where LIFNR!='' and LIFNR is not null;
view CustomerNumberValueHelp as select distinct key KUNNR from PumoriLocationsView where KUNNR!='' and KUNNR is not null;
view PostalCodeValueHelp as select distinct key PSTLZ from PumoriLocationsView where PSTLZ!='' and PSTLZ is not null;
view POBoxPostalCodeValueHelp as select distinct key PSTL2 from PumoriLocationsView where PSTL2!='' and PSTL2 is not null;
view BusinessUnitValueHelp as select distinct key BUSINESS_UNIT from PumoriLocationsView where BUSINESS_UNIT!='' and BUSINESS_UNIT is not null;
view CustomerClassificationValueHelp as select distinct key KUKLA from PumoriLocationsView where KUKLA!='' and KUKLA is not null;
view DummyforIntegrationValueHelp as select distinct key DUMMY_TS_LOC from PumoriLocationsView where DUMMY_TS_LOC!='' and DUMMY_TS_LOC is not null;
view ETAETDValueHelp as select distinct key ETA_ETD from PumoriLocationsView where ETA_ETD!='' and ETA_ETD is not null;
view PlantValueHelp as select distinct key WERKS from PumoriLocationsView where WERKS!='' and WERKS is not null;
view PlanningAreaValueHelp as select distinct key PA_Name from PumoriLocationsView where PA_Name!='' and PA_Name is not null;