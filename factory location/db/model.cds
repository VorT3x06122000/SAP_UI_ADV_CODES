namespace pumorips.factorylocation;

using {managed} from '@sap/cds/common';

entity FactoryLocations : managed {
    key factoryNumber        : String(20);
    key locId                : String(20);
        locDescr             : String(100);
    key locType              : String(1)
        @assert.notNull
        @assert.range enum {
            PlantORDistributioncenter = 'P';
            Supplier                  = 'V';
        };
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
        custAttr4            : Date;
        custAttr5            : String(20);
        custAttr6            : String(20);
        custAttr7            : Integer;
        custAttr8            : Decimal(13, 3);
        custAttr9            : Decimal(5, 2);
        custAttr10           : String(40);
}

/* Transformation table */
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

/*Location Type details*/
@cds.persistence.exists
entity syn_LocationTypes {
    key locType     : String(1);
        locTypeText : String(35);
}

/*Config table details*/
@cds.persistence.exists
entity syn_PumoriConfig {
    key businessGroup : String(5);
    key appName       : String(20);
    key param1        : String(25);
        param2        : String(15);
        value1        : String(15);
        value2        : String(15);
}

/*HP location table */
@cds.persistence.exists
entity syn_HPLocations {
    key locno                : String(20);
    key locType              : String(1);
        name1                : String(100);
        vendor_Grp           : String(10);
        locationContact1Name : String(10);
        locationContact2Name : String(80);
        locationContact3Name : String(80);
        locationContact4Name : String(80);
        land1                : String(2);
        regio                : String(40);
        ort01                : String(35);
        PSTLZ                : String(10);
        PSTL2                : String(10);
        STRAS                : String(35);
        LOEVM                : String(1);
        TIME_ZONE            : String(6);
        TELF1                : String(16);
        BUSINESS_UNIT        : String(2);
        region               : String(4);
        PLIFZ                : Decimal(3, 0);
        FABKL                : String(32);
        PA_NAME              : String(4);
        WERKS                : String(4);
        LIFNR                : String(10);
        KUNNR                : String(10);
        Nodetype             : String(10);
        Plant_type           : String;
        ACTIVE_FLAG          : String(1);
        DABNODE_FLAG         : String(1);
        CUST_ATTR1           : String(10);
        CUST_ATTR2           : String(10);
        CUST_ATTR3           : String(10);
        CUST_ATTR4           : Date;
        CUST_ATTR5           : String(20);
        CUST_ATTR6           : String(10);
        CUST_ATTR7           : Integer;
        CUST_ATTR8           : Decimal(13, 3);
        CUST_ATTR9           : Decimal(3, 2);
        CUST_ATTR10          : String(40);
        KUKLA                : String(4);
        LONGITUDE            : Decimal(17, 0);
        LATITUDE             : Decimal(17, 0);
        DUMMY_TS_LOC         : String(10);
        ETA_ETD              : String(10);
}

/* Factory Dashboard table syn */
@cds.persistence.exists
entity syn_FactoryStatusDashboard {
    key factoryId         : String(20);
    key interface         : String(20);
    key fileName          : String(50);
    key uploadedtime      : Timestamp;
        date              : Date;
        processTime       : String(10);
        status            : String(10);
        records           : Integer;
        successfulRecords : Integer;
        errorRecords      : Integer;
        prococessing      : String(20);
}
@cds.persistence.exists
entity syn_FactoryStatusResponse : managed {
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

/*LocationProducts table*/
@cds.persistence.exists
entity syn_LocationProducts : managed {
    key factoryNumber        : String(20);
    key locId                : String(20);
    key prodId               : String(50);
        zmanuName            : String(100);
        em                   : Date;
        procurementType      : String(1);
        grprocessingTime     : Integer;
        ztargetBuffer        : Integer;
        zcancelWindow        : String(12);
        planneddeliveryTime  : Integer;
        zinHouseLeadTime     : Integer;
        soleSourceFlag       : String(1);
        outSource            : String(20);
        foundry1             : String(100);
        foundry1Site         : String(40);
        foundry1Country      : String(20);
        foundry2             : String(100);
        foundry2Site         : String(40);
        foundry2Country      : String(20);
        waferSize            : String(20);
        nodeProcess          : String(100);
        nodeProcessGroup     : String(50);
        packingHouse1        : String(100);
        packingHouse1Country : String(40);
        packingHouse2        : String(100);
        packingHouse2Country : String(40);
        packingType          : String(20);
        pin                  : Integer;
        packageSize          : String(20);
        testingHouse1        : String(100);
        testingHouse1Country : String(40);
        testingHouse2        : String(100);
        testingHouse2Country : String(40);
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
}

/* Factory T-Lane Table*/
@cds.persistence.exists
entity syn_Translane : managed {
    key factoryNumber     : String(20);
    key prodId            : String(50);
    key locFr             : String(20);
    key locfrType         : String(1)
        @assert.notNull
        @assert.range enum {
            ShippedByVendor       = 'V';
            ShippedByAnotherPlant = 'P';
        };
    key locTo             : String(20);
    key loctoType         : String(1);
        mot               : String(20);
        leadTime          : Integer;
        coO               : String(40);
        lotSize           : Integer;
        moq               : Integer;
        pPriority         : Integer;
        zQuota            : Integer;
        spQ               : Integer;
        sourcingModel     : String(4);
        markedforDeletion : String(1);
        custAttr1         : String(10);
        custAttr2         : String(10);
        custAttr3         : String(10);
        custAttr4         : Date;
        custAttr5         : String(20);
        custAttr6         : String(20);
        custAttr7         : Integer;
        custAttr8         : Decimal(13, 3);
        custAttr9         : Decimal(5, 2);
        custAttr10        : String(40);
    key validFrom          : Date;
    key validTo             : Date;
}

/*Factory Location*/
view FactoryLocationView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key factoryNumber,
        key locId,
            locDescr,
        key locType,
            case FactoryLocations.locType
                when
                    'P'
                then
                    'P(Plant or Distribution center)'
                when
                    'V'
                then
                    'V(Supplier)'
            end as locTypeText : String(20),
            zplantType,
            locRegion,
            locationAddress1,
            locationAddress2,
            city,
            state,
            country,
            countryCode,
            zipcode,
            locationContact1Name,
            locationEmail1,
            locationContact2Name,
            locationEmail2,
            markedforDeletion
    from FactoryLocations;

/*Country Value help */
view CountryValueHelp as select distinct key country from FactoryLocations;
/*Factory number Value help */
view FactoryNumberValueHelp as select distinct key factoryNumber  from FactoryLocations;

/*LocationId number Value help */
view LocationIDValueHelp as
    select distinct
        key locId
    from FactoryLocations;

/*LocationDescr Value help */
view LocationDescrValueHelp as
    select distinct
        key locDescr
    from FactoryLocations;

/*LocationType view */
view LocationTypeValues as
    select distinct
        key locType,
            locTypeText
    from syn_LocationTypes;

/*City Value help */
view CityValueHelp as select distinct key city  from FactoryLocations where city!='' and city is not null;

/*Country Code Value help */
view CountyCodeValueHelp as select distinct key countryCode  from FactoryLocations where countryCode!='' and countryCode is not null;

/*Location Address1 Value help */
view LocAddr1ValueHelp as select distinct key locationAddress1  from FactoryLocations where locationAddress1!='' and locationAddress1 is not null;

/*Location Address2 Value help */
view LocAddr2ValueHelp as select distinct key locationAddress2  from FactoryLocations where locationAddress2!='' and locationAddress2 is not null;

/*Location Contact1 Value help */
view LocCont1ValueHelp as select distinct key locationContact1Name  from FactoryLocations where locationContact1Name!='' and locationContact1Name is not null;

/*Location Contact2 Value help */
view LocCont2ValueHelp as select distinct key locationContact2Name  from FactoryLocations where locationContact2Name!='' and locationContact2Name is not null;

/*Location Email1 Value help */
view LocEmail1ValueHelp as select distinct key locationEmail1  from FactoryLocations where locationEmail1!='' and locationEmail1 is not null;

/*Location Email2 Value help */
view LocEmail2ValueHelp as select distinct key locationEmail2  from FactoryLocations where locationEmail2!='' and locationEmail2 is not null;

/*Location Region Value help */
view LocRegionValueHelp as select distinct key locRegion  from FactoryLocations where locRegion!='' and locRegion is not null;

/*State Value help */
view StateValueHelp as select distinct key state  from FactoryLocations where state!='' and state is not null;

/*State Value help */
view ZipcodeValueHelp as select distinct key zipcode  from FactoryLocations where zipcode!='' and zipcode is not null;

/* Location transformation View */

view LocationTransformationView as
    select
        key Factory,
        key VendorId,
        key locType,
        case FaclocTransformation.locType
                when
                    'P'
                then
                    'P(Plant or Distribution center)'
                when
                    'V'
                then
                    'V(Supplier)'
            end as locTypeText : String(20),
            VendorName,
            VendorGroup,
            Keeperflag,
            markedforDeletion
    from FaclocTransformation;

/*Vendor ID Value help */
view VendorIDValueHelp as select distinct key VendorId  from FaclocTransformation;

/*Vendor Name Value help */
view VendorNameValueHelp as select distinct key VendorName  from FaclocTransformation;

/*Vendor Group Value help */
view VendorGrpValueHelp as select distinct key VendorGroup  from FaclocTransformation;

/*Factory Number Value help */
view FactoryTransValueHelp as select distinct key Factory  from FaclocTransformation;

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
    from syn_FactoryStatusResponse;