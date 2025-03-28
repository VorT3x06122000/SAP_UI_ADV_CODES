/*//-----------------------------------------------------------------------------------*
//Confidential and Proprietary
//Copyright 2021, HP
//All Rights Reserved
//-----------------------------------------------------------------------------------*
// Application Name :    Manage Pumori Location Master
// WRICEF No        :
// Release          :    M1 Release
// Author           :    UdayWaD,BindalSh
// Date             :    30.03.2022
// Description      :    Manage Pumori Location Master
//-----------------------------------------------------------------------------------*
//Descriptions: Used for data modelling
//-----------------------------------------------------------------------------------*
//Change Log:
//    Date      |   Author      |   Defect/Incident     |   Change Description
//  06.01.2022  |   UdayWaD     |     ODW Release       |   Overflow fields added
//  06.13.2022  |   UdayWaD     |     M2 Release        |   CR Changes
//  12.22.2022  |   JaAyushi    |     CR-22             |   Location MasterList Table added.
//-----------------------------------------------------------------------------------*/
namespace pumori.pumorilocation;

using {managed} from '@sap/cds/common';

/**
 * _********SCP tables********_\*\*
 */

/*PumoriLocations table*/
entity PumoriLocations : managed {
        locDescr             : String(35);
        locDescrOf           : String(65);
    key locId                : String(20);
    key locType              : String(1);
        zlocPriority         : Integer;
        plantType            : String(3);
        zplantType           : String(40);
        zsupplierName        : String(40);
        zmanuName            : String(40);
        zmanuNameOf          : String(60);
        zorigsupplierId      : String(20);
        zorigfactoryNo       : String(20);
        locRegion            : String(20);
        locationAddress1     : String(80);
        locationAddress2     : String(80);
        locationAddress1Of   : String(120);
        city                 : String(35);
        state                : String(35);
        zcountry             : String(40);
        zipcode              : String(10);
        locationContact1Name : String(80);
        locationEmail1       : String(80);
        locationContact2Name : String(80);
        locationEmail2       : String(80);
        locationContact3Name : String(80);
        locationEmail3       : String(80);
        locationContact4Name : String(80);
        locationEmail4       : String(80);
        locationContact5Name : String(80);
        locationEmail5       : String(80);
        locationContact6Name : String(80);
        locationEmail6       : String(80);
        timeZone             : String(6);
        delFlag              : String(1);
        factoryCalender      : String(32);
        zMarket              : String(40);
        zGoc                 : String(40);
        zRegion              : String(20);
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
        longitude            : Decimal(17);
        latitude             : Decimal(17); 
        opsiId               : String(10);
        dunsNumber           : String(100);
        opsiflag            : String(10);
}


/*FactoryLocations table data*/
@cds.persistence.exists
entity syn_FactoryLocations {
    key factoryNumber        : String(20);
    key locId                : String(20);
        locDescr             : String(35);
    key locType              : String(1);
        plantType            : String(10);
        zplantType           : String(40);
        locRegion            : String(20);
        locationAddress1     : String(80);
        locationAddress2     : String(80);
        city                 : String(35);
        state                : String(35);
        zcountry             : String(40);
        zipcode              : String(10);
        locationContact1Name : String(80);
        locationEmail1       : String(80);
        locationContact2Name : String(80);
        locationEmail2       : String(80);
        locationContact3Name : String(80);
        locationEmail3       : String(80);
        locationContact4Name : String(80);
        locationEmail4       : String(80);
        locationContact5Name : String(80);
        locationEmail5       : String(80);
        locationContact6Name : String(80);
        locationEmail6       : String(80);
        timeZone             : String(6);
        delFlag              : String(1);
        locDescrOf           : String(65);
        locationAddress1Of   : String(120);
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

/*HPLocations table data*/
@cds.persistence.exists
entity syn_HPLocations {
    key locId             : String(20);
        locDescr          : String(35);
    key locType           : String(1)
                                      @assert.notNull
                                      @assert.range enum {
                Customer                  = 'C';
                PlantORDistributioncenter = 'P';
                Supplier                  = 'V';
            };
        plantType         : String(3) @assert.range enum {
            ProductionPlant               = 'PL';
            DistributionCentre            = 'DC';
        };
        zplantType        : String(40);
        locRegion         : String(20);
        locationAddress1  : String(80);
        city              : String(35);
        state             : String(35);
        country           : String(10);
        zipcode           : String(40);
        timeZone          : String(6);
        markedforDeletion : String(1);
        factoryCalender   : String(32);
        zMarket           : String(40);
        zRegion           : String(20);
        longitude         : Decimal(17, 12);
        latitude          : Decimal(17, 12);
// replicationDateTime : Timestamp;
}


/*MasterList table data*/
@cds.persistence.exists
entity syn_LocationMasterList{
    key factoryNumber : String(20);
    key zHpPartno      : String(40);
    key mpn            : String(50);
    key locId          : String(20);
        zsupplierName  : String(100); //zsupplier name 40 ->100
        zmanuName      : String(100); // zmanuNameOf
        stdManuName    : String(40); // zmanuName
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

/*UploadHistory table*/
@cds.persistence.exists
entity syn_UploadHistory {
    key appName    : String(10);
    key processId  : String(25);
        createdAt  : Timestamp;
        createdBy  : String(255);
        modifiedBy : String(255);
        modifiedAt : Timestamp;
        status     : String(70);
        records    : String(30);
}

@cds.persistence.exists
entity syn_UploadResponse : managed {
    key appName      : String(10);
    key processId    : String(25);
    key param1       : String(40);
    key param2       : String(40);
    key param3       : String(40);
    key param4       : String(40);
    key param5       : String(40);
    key param6       : String(40);
    key param7       : String(40);
        errordetails : String(255);
}

/*OpsiIdResponse entity mapping*/ 

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

/*Upload History View*/
view UploadHistoryView as
    select
        key appName,
        key processId,
            createdAt,
            createdBy,
            modifiedBy,
            modifiedAt,
            status,
            records
    from syn_UploadHistory;

/*PumLoc Error response view*/
view PumLocErrorResponse as
    select
        key appName,
        key processId,
            param1 as locId,
            param2 as locType,
            errordetails
    from syn_UploadResponse;
/*PumoriLocations View */
view PumoriLocationsView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
            locDescr,
            locDescrOf,
        key a.locId,
        key a.locType,
            zlocPriority,
            case a.locType
                when
                    'C'
                then
                    'C(Customer)'
                when
                    'P'
                then
                    'P(Plant or Distribution center)'
                when
                    'V'
                then
                    'V(Supplier)'
            end as locTypeText   : String(20),
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
            zplantType,
            // zsupplierName,
            zorigsupplierId,
            zorigfactoryNo,
            locRegion,
            a.locationAddress1,
            locationAddress2,
            locationAddress1Of,
            a.city,
            a.state,
            a.zcountry,
            a.zipcode,
            locationContact1Name,
            locationEmail1,
            locationContact2Name,
            locationEmail2,
            locationContact3Name,
            locationEmail3,
            locationContact4Name,
            locationEmail4,
            locationContact5Name,
            locationEmail5,
            locationContact6Name,
            locationEmail6,
            timeZone,
            factoryCalender,
            zMarket,
            zGoc,
            zRegion,
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
            longitude,
            latitude,
            a.opsiId,
            b.dunsNumber,
            a.opsiflag,
        case when a.opsiflag = 'N/A'
        
            then 'N/A'

            when a.opsiId = '' OR a.opsiId is null

            then 'No'

            else 'Yes'

            end as marked: String
        from PumoriLocations as a
        left outer join OpsiIdResponse as b
        on b.locId = a.locId 
        and b.opsiId = a.opsiId;


/*LocIdValueHelp view */
view LocIdValueHelp as select distinct key locId from PumoriLocations;
/*CountryCodeValueHelp view */
view CountryCodeValueHelp as select distinct key zcountry from PumoriLocations;

/*zsupplierNameValueHelp view, featching data from Pumorilocations */
// view ZsuppnameValueHelp as
//     select distinct key zsupplierName from PumoriLocations
//     where
//         zsupplierName is not null;

/*zsupplierNameValueHelp view, featching data from masterlist */
view zsupplierNameValueHelp as select distinct key zsupplierName from syn_LocationMasterList;