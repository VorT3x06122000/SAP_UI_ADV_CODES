namespace pumorips.factoryproduct;

using {managed} from '@sap/cds/common';

/**
 * _********SCP tables********_\*\*
 */
/*FactoryProducts table*/
entity FactoryProducts : managed {
    key factoryNumber     : String(20);
    key prodId            : String(50);
        prodDesc          : String(200);
    key zmpaPartno        : String(50);
        zHpPartno         : String(40);
        baseunitofMeasure : String(3);
        materialType      : String(4)
        @asset.range enum {
            FinishedProduct      = 'FERT';
            Semi_FinishedProduct = 'HALB';
            Components           = 'ROH';
        };
        zplcStatus        : String(20);
        unspscCode        : String(9);
        zhfvType          : String(70);
        zhfvValue         : String(70);
        zintroDate        : Date;
        category          : String(4);
        materialGroup     : String(9);
        gatingAttribute   : String(1);
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
        originalHPPN      : String(40);
}

/*LocationProducts table*/
entity LocationProducts : managed {
    key factoryNumber        : String(20);
    key locId                : String(20);
    key prodId               : String(50);
        zmanuName            : String(100);
        em                   : Date;
        procurementType      : String(1)
        @asset.range enum {
            InHouseProduction    = 'E';
            ExternalProcurement  = 'F';
            BothProcurementTypes = 'X';
        };
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

/*UOM table*/
entity UOM : managed {
    key factoryNumber : String(20);
    key prodId        : String(50);
    key uomAlt        : String(3);
        denominator   : Decimal(10, 5);
        numerator     : Decimal(10, 5);
        custAttr1     : String(10);
        custAttr2     : String(10);
        custAttr3     : String(10);
        custAttr4     : Date;
        custAttr5     : String(20);
        custAttr6     : String(20);
        custAttr7     : Integer;
        custAttr8     : Decimal(13, 3);
        custAttr9     : Decimal(5, 2);
        custAttr10    : String(40);
}

/*UOMConversion table*/

entity UOMConversion : managed {
    key factoryNumber       : String(20); //LocationID
    key prodId              : String(50); //MPN
        zbtpComp            : String(40); //generatedhppn
    key uomAlt              : String(3);
        fbaseunitofMeasure  : String(3);
        hpbaseunitofMeasure : String(3);
        denominator         : Decimal(10, 5);
        numerator           : Decimal(10, 5);
}

entity BaseUOM : managed {
    key uomAlt            : String(3);
        baseunitofMeasure : String(3);
}

/*EDI Conversion table*/

entity EDIConversion : managed {
    key factoryNumber : String(20);
    key tdUOM         : String(2);
        mdUOM         : String(3);
}


/* Factory T-Lane Table*/

entity Translane : managed {
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
    key mot               : String(20);
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
    key validTo           : Date;
    key validFrom         : Date;
}

/*HPPNSequence table*/
entity HPPNSequence {
    key dataPum : String(10);
        seqId   : String(40);
}

/*HPPNSequence table for all unique combination*/
entity BTPCompSequence : managed {
        seq           : Integer;
        zbtpComp      : String(40);
    key factoryNumber : String(20);
    key prodId        : String(50);
    key zmpaPartno    : String(50);
        zHpPartno     : String(40);
        zoldbtpComp   : String(40);
        master        : String(10);
        status        : String(20);
        suggest       : String(40);
}

entity ChangeLog : managed {
        seq                : Integer;
    key zbtpComp           : String(40);
    key factoryNumber      : String(20);
    key prodId             : String(50);
    key zmpaPartno         : String(50);
        zHpPartno          : String(40);
        zoldbtpComp        : String(40);
        master             : String(10);
        status             : String(20);
        suggest            : String(40);
        changedby          : String(100);
        oldPumoriPN        : String(100);
        operationPerformed : String(100);

}

/*Pumori MOT table*/
@cds.persistence.exists
entity syn_PumoriMot {
    key modeofTransport     : String(10);
    key languageKey         : String(3);
        modeoftransportDesc : String(40);
}

/* Product Transformation*/
entity ProductTransformation : managed {
    key factoryNumber       : String(20);
    key prodId              : String(50);
    key zmpaPartno          : String(50);
        zbtpComp            : String(40);
        prodDesc            : String(200);
        zhfvType            : String(70);
        zhfvValue           : String(70);
        fbaseunitofMeasure  : String(3);
        hpbaseunitofMeasure : String(3);
        markedforDeletion   : String(1);
        originalHPPN      : String(40);
}

/*LocationProducts Transformation Table*/
entity LocationProductsTransformation : managed {
    key factoryNumber     : String(20);
    key prodId            : String(50);
    key locId             : String(20);
        zbtpComp          : String(40);
        procurementType   : String(1);
        markedforDeletion : String(1);
}


/*Product T-Lane Transformation*/
entity TlaneTransformation : managed {
    key pumoriPN          : String(40);
    key locFr             : String(20);
        locfrType         : String(1);
    key locTo             : String(20);
        loctoType         : String(1);
        leadTime          : Integer;
        zQuota            : Integer;
        markedforDeletion : String(1);
    key validTo           : Date;
    key validFrom         : Date;
    key mot               : String(20);
}

/**Feature Type,Feature value mapping **/
entity mappingFtFv : managed {
    key factoryNumber : String(4);
        zhfvtypeFac   : String(70);
        zhfvtypeHP    : String(70);
        zhfvvalueFac  : String(70);
        zhfvvalueHP   : String(70);
        default       : String(1);
}

/**FT FV from HP */
//Need to get from MS4 later on
entity ms4FTFV {
    zhfvtypeHP  : String(70);
    zhfvvalueHP : String(70);
}

/*Pumori Config table*/
@cds.persistence.exists
entity syn_PumoriConfig {
    key businessGroup : String(5);
    key appName       : String(20);
    key param1        : String(25);
        param2        : String(15);
        value1        : String(15);
        value2        : String(15);
}

/*Location Type details*/
@cds.persistence.exists
entity syn_LocationTypes {
    key locType     : String(1);
        locTypeText : String(35);
}


/*FactoryLocations table*/
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
}

/*HP Products View*/
@cds.persistence.exists
entity syn_HPProducts : managed {
    key zHpPartno              : String(40);
        prodDesc               : String(40);
        baseunitofMeasure      : String(3);
        materialType           : String(4);
        zplcStatus             : String(20);
        markedforDeletion      : String(1);
        zhfvtype               : String(70);
        zhfvvalue              : String(70);
        zcontrolCode           : String(40);
        materialGroup          : String(10);
        zmhbigSeries           : String(70);
        zmhbigseriesDesc       : String(40);
        zmhCategory            : String(70);
        zmhCategoryDesc        : String(40);
        zmhModel               : String(70);
        zmhModelDesc           : String(40);
        zmhSeries              : String(70);
        zmhSeriesDesc          : String(40);
        zmhsubCategory         : String(70);
        zmhsubcategoryDesc     : String(40);
        zmhType                : String(70);
        zmhtypeDesc            : String(40);
        zpchbusinessGrp        : String(40);
        zpchbusinessgrpDesc    : String(40);
        ZPCHBUSINESSSUBGRPDESC : String(40);
        ZPCHBUSINESSSUIBGRP    : String(30);
        zpchextSegment         : String(30);
        zpchextsegmentDesc     : String(40);
        zpchgBu                : String(40);
        zpchgbuDesc            : String(40);
        zpchhpCompany          : String(40);
        zpchhpcompanyDesc      : String(40);
        zpchprdcategoryDesc    : String(40);
        zpchprofitCenter       : String(10);
        zpchprofitcenterDesc   : String(40);
        zspPl                  : String(20);
        languageKey            : String(1);
        cust_Attr1             : String(10);
        cust_Attr2             : String(10);
        cust_Attr3             : String(10);
        cust_Attr4             : Date;
        cust_Attr5             : String(20);
        cust_Attr6             : String(20);
        cust_Attr7             : Integer;
        cust_Attr8             : Decimal(13, 3);
        cust_Attr9             : Decimal(5, 2);
        cust_Attr10            : String(40);
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

/* Factory Location Transformation */
@cds.persistence.exists
entity syn_FaclocTransformation {
    key Factory           : String(20);
    key VendorId          : String(20);
    key locType           : String(1)
        @assert.notNull
        @assert.range enum {
            PlantORDistributioncenter = 'P';
            Supplier                  = 'V';
        };
        VendorName        : String(100);
        VendorGroup       : String(20);
        Keeperflag        : String(1);
        markedforDeletion : String(1);
}

/**
 * _********VIEWS********_\*\*
 */
/* MPN Value help */
view MPNValueHelp as
    select from FactoryProducts distinct {
        key prodId,
            factoryNumber,
            zmpaPartno,
            zHpPartno
    };

/* Factory Number Value help */
view FactoryNumberValueHelp as
    select from MPNValueHelp distinct {
        key factoryNumber
    };

/* Factory Part Number Value help */
view FactoryPartNumberValueHelp as
    select from MPNValueHelp distinct {
        key zmpaPartno
    };

/* Hp Part Number Value help */
view HpPartNumberValueHelp as
    select from MPNValueHelp distinct {
        key zHpPartno
    };

/* prodId Value help */
view prodIdValueHelpProd as select distinct key prodId from FactoryProductsView;
/* MPN Value help For Product Location Screen*/
view MPNValueHelpLocProd as
    select from LocationProducts distinct {
        key prodId,
            locId,
            factoryNumber
    };

/* LocationId Value help For Product Location Screen*/
view locationIdValueHelpLocProd as
    select from MPNValueHelpLocProd distinct {
        key locId
    };

/* Facotry Number Value help For Product Location Screen*/
view factoryNumberValueHelplocProd as
    select from MPNValueHelpLocProd distinct {
        key factoryNumber
    };
view prodIdValueHelpLocProd as select distinct key prodId from LocationProductsView;
/*FactoryProducts View*/
view FactoryProductsView as
    select
            a.createdAt,
            a.createdBy,
            a.modifiedAt,
            a.modifiedBy,
        key a.factoryNumber,
        key a.prodId,
        key a.zmpaPartno,
            b.zbtpComp,
            prodDesc,
            a.zHpPartno,
            baseunitofMeasure,
            case a.materialType
                when
                    'FERT'
                then
                    'FERT'
                when
                    'HALB'
                then
                    'HALB'
                when
                    'ROH'
                then
                    'ROH'
            end as materialTypeText : String(20),
            zplcStatus,
            unspscCode,
            zhfvType,
            zhfvValue,
            zintroDate,
            materialGroup,
            gatingAttribute,
            category,
            markedforDeletion,
            originalHPPN
    from FactoryProducts as a
    inner join BTPCompSequence as b
        on  a.prodId        = b.prodId
        and a.factoryNumber = b.factoryNumber
        and a.zmpaPartno  = b.zmpaPartno;

/*LocationProducts View*/
view LocationProductsView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key factoryNumber,
        key locId,
        key prodId,
            zmanuName,
            em,
            procurementType,
            case LocationProducts.procurementType
                when
                    'E'
                then
                    'E(In-house Production)'
                when
                    'F'
                then
                    'F(External Procurement)'
                when
                    'X'
                then
                    'X(Both Procurement Types)'
            end as procurementTypeText : String(20),
            grprocessingTime,
            ztargetBuffer,
            zcancelWindow,
            planneddeliveryTime,
            zinHouseLeadTime,
            soleSourceFlag,
            outSource,
            foundry1,
            foundry1Site,
            foundry1Country,
            foundry2,
            foundry2Site,
            foundry2Country,
            waferSize,
            nodeProcess,
            nodeProcessGroup,
            packingHouse1,
            packingHouse1Country,
            packingHouse2,
            packingHouse2Country,
            packingType,
            pin,
            packageSize,
            testingHouse1,
            testingHouse1Country,
            testingHouse2,
            testingHouse2Country,
            markedforDeletion
    from LocationProducts;

/*Location Products Value Help */
view zcancelWindowValueHelp as
    select from LocationProductsView distinct {
        key zcancelWindow
    };

view outSourceValueHelp as
    select from LocationProductsView distinct {
        key outSource
    };

view foundry1ValueHelp as
    select from LocationProductsView distinct {
        key foundry1
    };

view foundry1SiteValueHelp as
    select from LocationProductsView distinct {
        key foundry1Site
    };

view foundry1CountryValueHelp as
    select from LocationProductsView distinct {
        key foundry1Country
    };

view foundry2ValueHelp as
    select from LocationProductsView distinct {
        key foundry2
    };

view foundry2SiteValueHelp as
    select from LocationProductsView distinct {
        key foundry2Site
    };

view foundry2CountryValueHelp as
    select from LocationProductsView distinct {
        key foundry2Country
    };

view waferSizeValueHelp as
    select from LocationProductsView distinct {
        key waferSize
    };

view nodeProcessValueHelp as
    select from LocationProductsView distinct {
        key nodeProcess
    };

view nodeProcessGroupValueHelp as
    select from LocationProductsView distinct {
        key nodeProcessGroup
    };

view packingHouse1ValueHelp as
    select from LocationProductsView distinct {
        key packingHouse1
    };

view packingHouse1CountryValueHelp as
    select from LocationProductsView distinct {
        key packingHouse1Country
    };

view packingHouse2ValueHelp as
    select from LocationProductsView distinct {
        key packingHouse2
    };

view packingHouse2CountryValueHelp as
    select from LocationProductsView distinct {
        key packingHouse2Country
    };

view packingTypeValueHelp as
    select from LocationProductsView distinct {
        key packingType
    };

view packageSizeValueHelp as
    select from LocationProductsView distinct {
        key packageSize
    };

view testingHouse1ValueHelp as
    select from LocationProductsView distinct {
        key testingHouse1
    };

view testingHouse1CountryValueHelp as
    select from LocationProductsView distinct {
        key testingHouse1Country
    };

view testingHouse2ValueHelp as
    select from LocationProductsView distinct {
        key testingHouse2
    };

view testingHouse2CountryValueHelp as
    select from LocationProductsView distinct {
        key testingHouse2Country
    };

view LocationProductsTransformationView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key factoryNumber,
        key prodId,
        key locId,
            zbtpComp,
            procurementType,
            case LocationProductsTransformation.procurementType
                when
                    'E'
                then
                    'E(In-house Production)'
                when
                    'F'
                then
                    'F(External Procurement)'
                when
                    'X'
                then
                    'X(Both Procurement Types)'
            end as procurementTypeText : String(20),
            markedforDeletion
    from LocationProductsTransformation;

view HpUoM as
    select distinct
        zHpPartno,
        baseunitofMeasure
    from syn_HPProducts;

/*Factory number Value help */
view FactoryNumberValueHelpLocProdTrans as select distinct key factoryNumber as factoryNumber from LocationProductsTransformationView;
/*ProdId value help */
view MPNValueHelpLocProdTrans as select distinct key prodId from LocationProductsTransformationView;
/*zbtpComp value help */
view PumoriPNValueHelpLocProdTrans as select distinct key zbtpComp from LocationProductsTransformationView;
/*LocationId number Value help */
view LocationIDValueHelpLocProdTrans as select distinct key locId from LocationProductsTransformationView;
/* procurementType value help */
view ProcurementTypeValueHelp as select distinct key procurementTypeText from LocationProductsView;
/* zbtpcomp value help */
view zbtpValueHelp as select distinct key zbtpComp from LocationProductsTransformationView;
/* procurementType value help */
view proctypHelp as select distinct key procurementTypeText from LocationProductsTransformationView;
view zmanuNameHelp as select distinct key zmanuName from LocationProductsView;

/*LocationType view */
view LocationTypeValues as
    select distinct
        key locType,
            locTypeText
    from syn_LocationTypes
    where
            locType is not null
        and locType !=     '';

/*TransLaneView View*/
view TransLaneView as
    select
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key factoryNumber,
        key prodId,
        key locFr,
        key locfrType,
            case Translane.locfrType
                when
                    'V'
                then
                    'V(Shipped By Vendor)'
                when
                    'P'
                then
                    'P(Shipped By Another Plant)'
            end as locfrTypeText : String(40),
        key locTo,
        key loctoType,
        key mot,
            leadTime,
            coO,
            lotSize,
            moq,
            pPriority,
            zQuota,
            spQ,
            sourcingModel,
            markedforDeletion,
        key validTo,
        key validFrom
    from Translane;

    view motValueHelp as select distinct key mot from TransLaneView;
    view coOValueHelp as select distinct key coO from TransLaneView;
    view sourcingModelValueHelp as select distinct key sourcingModel from TransLaneView;

view TlaneValueHelp as
    select from Translane distinct {
        key factoryNumber,
            prodId,
            locFr,
            locfrType,
            locTo,
            loctoType,
            validTo,
            validFrom
    };

view factoryNumberTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key factoryNumber
    };

view prodIdTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key prodId
    };

view locFrTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key locFr
    };

view locFrTypeTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key locfrType
    };

view locToTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key locTo
    };

view loctoTypeTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key loctoType
    };

view validfromTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key validFrom
    };

view validtoTlaneValueHelp as
    select from TlaneValueHelp distinct {
        key validTo
    };

view TlaneTransformationView as
    select from TlaneTransformation distinct {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy,
        key pumoriPN,
        key locFr,
            locfrType,
            case TlaneTransformation.locfrType
                when
                    'V'
                then
                    'V(Shipped By Vendor)'
                when
                    'P'
                then
                    'P(Shipped By Another Plant)'
            end as locfrTypeText : String(40),
        key locTo,
            loctoType,
            leadTime,
            zQuota,
            markedforDeletion,
        key validTo,
        key validFrom,
        key mot
    };

view transmotValueHelp as select distinct key mot from TlaneTransformation;

view pumoriPNTlaneTransValHelp as
    select from TlaneTransformation distinct {
        key pumoriPN,
            locFr,
            locfrType,
            locTo,
            loctoType,
            validTo,
            validFrom
    };

view locFrTlaneTransValHelp as
    select from pumoriPNTlaneTransValHelp distinct {
        key locFr
    };

view locToTlaneTransValHelp as
    select from pumoriPNTlaneTransValHelp distinct {
        key locTo
    };

view validToTlaneTransValueHelp as
    select from pumoriPNTlaneTransValHelp distinct {
        key validTo
    };

view validFromTlaneTransValueHelp as
    select from pumoriPNTlaneTransValHelp distinct {
        key validFrom
    };

view UOMView as
    select from UOM distinct {
        key factoryNumber,
        key prodId,
        key uomAlt,
            denominator,
            numerator
    };

/*UOM Value Helps */
view factoryNumberUOMValuehelp as select distinct key factoryNumber from UOMView;
view prodIdUOMValuehelp as select distinct key prodId from UOMView;
view uomAltUOMValuehelp as select distinct key uomAlt from UOMView;

view factoryNumberManagePartValueHelp as
    select from BTPCompSequence distinct {
        key factoryNumber,
            prodId,
            zbtpComp,
            zmpaPartno
    };

view facNumManagePartValueHelp as select distinct key factoryNumber from BTPCompSequence;

view prodIdManagePartValueHelp as
    select from factoryNumberManagePartValueHelp distinct {
        key prodId
    };

view zbtpCompManagePartValueHelp as
    select from factoryNumberManagePartValueHelp distinct {
        key zbtpComp
    };

view zmpapartnoManagePartValueHelp as
    select from factoryNumberManagePartValueHelp distinct {
        key zmpaPartno
    };

view zHpPartnoManagePartValueHelp as
    select distinct key zHpPartno from BTPCompSequence
    where zHpPartno !='' and zHpPartno is not null;

view zoldbtpCompManagePartValueHelp as
    select distinct key zoldbtpComp from BTPCompSequence
    where zoldbtpComp !='' and zoldbtpComp is not null;

view masterManagePartValueHelp as
    select distinct key master from BTPCompSequence
    where master !='' and master is not null;

view statusManagePartValueHelp as
    select distinct key status from BTPCompSequence
    where status !='' and status is not null;

view suggestManagePartValueHelp as
    select distinct key suggest from BTPCompSequence
    where suggest !='' and suggest is not null;


view materialTypeTexthelp as select distinct key materialTypeText from FactoryProductsView;
view FTTexthelp as select distinct key zhfvType from FactoryProductsView;
view FVTexthelp as select distinct key zhfvValue from FactoryProductsView;
/*Factory Number Product Transformation Value help */
view FactoryNoProdTransValuehelp as select distinct key factoryNumber from ProductTransformation;
/*MPN Product Transformation Value help */
view MPNProdTransValuehelp as select distinct key prodId from ProductTransformation;
/*Factory Part Number Product Transformation Value help */
view FactoryPartNoProdTransValuehelp as select distinct key zmpaPartno from ProductTransformation;
/*Factory Number Product Transformation Value help */
view zbtpcompprodtranshelp as select distinct key zbtpComp from ProductTransformation;
/*Feature Type Product Transformation Value help */
view zhfvTypepprodtranshelp as select distinct key zhfvType from ProductTransformation;
view FVprodtranshelp as select distinct key zhfvValue from ProductTransformation;

view prodDescprodtranshelp as
    select distinct key prodDesc from ProductTransformation
    where prodDesc !='' and prodDesc is not null;

view fbuomprodtranshelp as
    select distinct key fbaseunitofMeasure from ProductTransformation
    where fbaseunitofMeasure !='' and fbaseunitofMeasure is not null;

view hpbuomprodtranshelp as
    select distinct key hpbaseunitofMeasure from ProductTransformation
    where hpbaseunitofMeasure !='' and hpbaseunitofMeasure is not null;

/*Factory Product Value Helps */
view zbtpCompPartValueHelp as
    select from FactoryProductsView distinct {
        key zbtpComp
    };

view prodDescPartValueHelp as
    select from FactoryProductsView distinct {
        key prodDesc
    };

view baseunitofMeasurePartValueHelp as
    select from FactoryProductsView distinct {
        key baseunitofMeasure
    };

view zplcStatusPartValueHelp as
    select from FactoryProductsView distinct {
        key zplcStatus
    };

view unspscCodePartValueHelp as
    select from FactoryProductsView distinct {
        key unspscCode
    };

view materialGroupPartValueHelp as
    select from FactoryProductsView distinct {
        key materialGroup
    };

view categoryPartValueHelp as
    select from FactoryProductsView distinct {
        key category
    };

view BTPCompSequenceview as
    select from BTPCompSequence distinct {
        key zbtpComp,
        key prodId
    };

/*UploadHistory table*/
@cds.persistence.exists
entity syn_UploadHistory : managed {
    key appName    : String(30);
    key processId  : String(25);
        status     : String(70);
        records    : String(100);
        createdAt  : Timestamp;
        createdBy  : String(255);
        modifiedAt : Timestamp;
        modifiedBy : String(255);
}

@cds.persistence.exists
entity syn_UploadResponse : managed {
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
        createdAt      : Timestamp;
        createdBy      : String(255);
        modifiedAt     : Timestamp;
        modifiedBy     : String(255);
        errordetails   : String;
}


/*Upload History View*/
view UploadHistoryView as
    select
        key appName,
        key processId,
            status,
            records,
            modifiedAt,
            modifiedBy
    from syn_UploadHistory;

/*Upload Response View*/
view UploadResponseView as
    select
        key appName,
        key processId,
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
            errordetails
    from syn_UploadResponse;

/*Product Error response view*/
view ProductErrorResponse as
    select
        key appName,
        key processId,
            prodId,
            factoryNumber,
            zmpaPartno,
            modifiedAt,
            modifiedBy,
            errordetails
    from syn_UploadResponse;

/*Tlane Error response view*/
view TlaneErrorResponse as
    select
        key appName,
        key processId,
            factoryNumber,
            prodId,
            locFr,
            locfrType,
            locTo,
            loctoType,
            locType,
            modifiedAt,
            modifiedBy,
            errordetails
    from syn_UploadResponse;

/*ProdLoc Error response view*/
view ProdLocErrorResponse as
    select
        key appName,
        key processId,
            factoryNumber,
            prodId,
            locId,
            modifiedAt,
            modifiedBy,
            errordetails
    from syn_UploadResponse;

/*UOM Error response view*/
view UOMErrorResponse as
    select
        key appName,
        key processId,
            factoryNumber,
            prodId,
            uomAlt,
            modifiedAt,
            modifiedBy,
            errordetails
    from syn_UploadResponse;

/*Location Error response view*/
view LocationErrorResponse as
    select
        key appName,
        key processId,
            factoryNumber,
            locType,
            locId,
            modifiedAt,
            modifiedBy,
            errordetails
    from syn_UploadResponse;

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