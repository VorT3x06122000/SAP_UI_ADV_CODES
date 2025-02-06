using {pumorips.factoryproduct as FacProd} from '../db/pumoripsfactoryproductmaster-model';

service FactoryProductService @(requires: 'authenticated-user') {
    entity FactoryProducts                     as projection on FacProd.FactoryProducts;

    entity LocationProducts                    as projection on FacProd.LocationProducts;

    entity UOM                                 as projection on FacProd.UOM;
    entity HPPNSequence                        as projection on FacProd.HPPNSequence;


    entity BTPCompSequence @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'

        ]
    }])                                       as projection on FacProd.BTPCompSequence;


    entity Translane                          as projection on FacProd.Translane;

    entity MPNValueHelp                       as projection on FacProd.MPNValueHelp;
    entity FactoryNumberValueHelp             as projection on FacProd.FactoryNumberValueHelp;
    entity FactoryPartNumberValueHelp         as projection on FacProd.FactoryPartNumberValueHelp;
    entity HpPartNumberValueHelp              as projection on FacProd.HpPartNumberValueHelp;
    entity MPNValueHelpLocProd                as projection on FacProd.MPNValueHelpLocProd;
    entity locationIdValueHelpLocProd         as projection on FacProd.locationIdValueHelpLocProd;
    entity factoryNumberValueHelplocProd      as projection on FacProd.factoryNumberValueHelplocProd;
    entity factoryNumberTlaneValueHelp        as projection on FacProd.factoryNumberTlaneValueHelp;
    entity prodIdTlaneValueHelp               as projection on FacProd.prodIdTlaneValueHelp;
    entity locFrTlaneValueHelp                as projection on FacProd.locFrTlaneValueHelp;
    entity locFrTypeTlaneValueHelp            as projection on FacProd.locFrTypeTlaneValueHelp;
    entity locToTlaneValueHelp                as projection on FacProd.locToTlaneValueHelp;
    entity loctoTypeTlaneValueHelp            as projection on FacProd.loctoTypeTlaneValueHelp;
    entity validfromTlaneValueHelp            as projection on FacProd.validfromTlaneValueHelp;
    entity validtoTlaneValueHelp              as projection on FacProd.validtoTlaneValueHelp;
    entity FactoryProductsView                as projection on FacProd.FactoryProductsView;
    entity LocationProductsView               as projection on FacProd.LocationProductsView;
    entity TransLaneView                      as projection on FacProd.TransLaneView;
    entity UOMConversion                      as projection on FacProd.UOMConversion;
    entity transmotValueHelp                  as projection on FacProd.transmotValueHelp;
    

    entity BaseUOM @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'

        ]
    }])                                       as projection on FacProd.BaseUOM;


    entity EDIConversion @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'

        ]
    }])                                       as projection on FacProd.EDIConversion;


    entity ProductTransformation              as projection on FacProd.ProductTransformation;
    entity TlaneTransformation                as projection on FacProd.TlaneTransformation;
    entity TlaneTransformationView            as projection on FacProd.TlaneTransformationView;
    entity pumoriPNTlaneTransValHelp          as projection on FacProd.pumoriPNTlaneTransValHelp;
    entity locFrTlaneTransValHelp             as projection on FacProd.locFrTlaneTransValHelp;
    entity locToTlaneTransValHelp             as projection on FacProd.locToTlaneTransValHelp;
    entity validToTlaneTransValueHelp         as projection on FacProd.validToTlaneTransValueHelp;
    entity validFromTlaneTransValueHelp       as projection on FacProd.validFromTlaneTransValueHelp;
    entity UOMView                            as projection on FacProd.UOMView;
    entity LocationProductsTransformation     as projection on FacProd.LocationProductsTransformation;
    entity LocationProductsTransformationView as projection on FacProd.LocationProductsTransformationView;
    entity FactoryNumberValueHelpLocProdTrans as projection on FacProd.FactoryNumberValueHelpLocProdTrans;
    entity MPNValueHelpLocProdTrans           as projection on FacProd.MPNValueHelpLocProdTrans;
    entity PumoriPNValueHelpLocProdTrans      as projection on FacProd.PumoriPNValueHelpLocProdTrans;
    entity LocationIDValueHelpLocProdTrans    as projection on FacProd.LocationIDValueHelpLocProdTrans;
    entity LocationTypeValues                 as projection on FacProd.LocationTypeValues;
    entity factoryNumberManagePartValueHelp   as projection on FacProd.factoryNumberManagePartValueHelp;
    entity prodIdManagePartValueHelp          as projection on FacProd.prodIdManagePartValueHelp;
    entity zbtpCompManagePartValueHelp        as projection on FacProd.zbtpCompManagePartValueHelp;
    entity zmpapartnoManagePartValueHelp      as projection on FacProd.zmpapartnoManagePartValueHelp;
    entity ProcurementTypeValueHelp           as projection on FacProd.ProcurementTypeValueHelp;
    entity facNumManagePartValueHelp          as projection on FacProd.facNumManagePartValueHelp;
    entity zbtpcompprodtranshelp              as projection on FacProd.zbtpcompprodtranshelp;
    entity zhfvTypepprodtranshelp             as projection on FacProd.zhfvTypepprodtranshelp;
    entity zbtpValueHelp                      as projection on FacProd.zbtpValueHelp;
    entity proctypHelp                        as projection on FacProd.proctypHelp;
    entity materialTypeTexthelp               as projection on FacProd.materialTypeTexthelp;
    entity FactoryNoProdTransValuehelp        as projection on FacProd.FactoryNoProdTransValuehelp;
    entity MPNProdTransValuehelp              as projection on FacProd.MPNProdTransValuehelp;
    entity FactoryPartNoProdTransValuehelp    as projection on FacProd.FactoryPartNoProdTransValuehelp;
    entity BTPCompSequenceview                as projection on FacProd.BTPCompSequenceview;
    entity zHpPartnoManagePartValueHelp       as projection on FacProd.zHpPartnoManagePartValueHelp;
    entity zoldbtpCompManagePartValueHelp     as projection on FacProd.zoldbtpCompManagePartValueHelp;
    entity masterManagePartValueHelp          as projection on FacProd.masterManagePartValueHelp;
    entity statusManagePartValueHelp          as projection on FacProd.statusManagePartValueHelp;
    entity suggestManagePartValueHelp         as projection on FacProd.suggestManagePartValueHelp;
    entity UploadHistoryView                  as projection on FacProd.UploadHistoryView;
    entity UploadResponseView                 as projection on FacProd.UploadResponseView;
    entity ProductErrorResponse               as projection on FacProd.ProductErrorResponse;
    entity TlaneErrorResponse                 as projection on FacProd.TlaneErrorResponse;
    entity ProdLocErrorResponse               as projection on FacProd.ProdLocErrorResponse;
    entity UOMErrorResponse                   as projection on FacProd.UOMErrorResponse;
    entity LocationErrorResponse              as projection on FacProd.LocationErrorResponse;
    entity zmanuNameHelp                      as projection on FacProd.zmanuNameHelp;
    entity FTTexthelp                         as projection on FacProd.FTTexthelp;
    entity FVTexthelp                         as projection on FacProd.FVTexthelp;
    entity FVprodtranshelp                    as projection on FacProd.FVprodtranshelp;
    entity FactoryStatusResponseView          as projection on FacProd.FactoryStatusResponseView;
    entity zbtpCompPartValueHelp              as projection on FacProd.zbtpCompPartValueHelp;
    entity prodDescPartValueHelp              as projection on FacProd.prodDescPartValueHelp;
    entity baseunitofMeasurePartValueHelp     as projection on FacProd.baseunitofMeasurePartValueHelp;
    entity zplcStatusPartValueHelp            as projection on FacProd.zplcStatusPartValueHelp;
    entity unspscCodePartValueHelp            as projection on FacProd.unspscCodePartValueHelp;
    entity materialGroupPartValueHelp         as projection on FacProd.materialGroupPartValueHelp;
    entity categoryPartValueHelp              as projection on FacProd.categoryPartValueHelp;
    entity factoryNumberUOMValuehelp          as projection on FacProd.factoryNumberUOMValuehelp;
    entity prodIdUOMValuehelp                 as projection on FacProd.prodIdUOMValuehelp;
    entity uomAltUOMValuehelp                 as projection on FacProd.uomAltUOMValuehelp;
    entity zcancelWindowValueHelp             as projection on FacProd.zcancelWindowValueHelp;
    entity outSourceValueHelp                 as projection on FacProd.outSourceValueHelp;
    entity foundry1ValueHelp                  as projection on FacProd.foundry1ValueHelp;
    entity foundry1SiteValueHelp              as projection on FacProd.foundry1SiteValueHelp;
    entity foundry1CountryValueHelp           as projection on FacProd.foundry1CountryValueHelp;
    entity foundry2ValueHelp                  as projection on FacProd.foundry2ValueHelp;
    entity foundry2SiteValueHelp              as projection on FacProd.foundry2SiteValueHelp;
    entity foundry2CountryValueHelp           as projection on FacProd.foundry2CountryValueHelp;
    entity waferSizeValueHelp                 as projection on FacProd.waferSizeValueHelp;
    entity nodeProcessValueHelp               as projection on FacProd.nodeProcessValueHelp;
    entity nodeProcessGroupValueHelp          as projection on FacProd.nodeProcessGroupValueHelp;
    entity packingHouse1ValueHelp             as projection on FacProd.packingHouse1ValueHelp;
    entity packingHouse1CountryValueHelp      as projection on FacProd.packingHouse1CountryValueHelp;
    entity packingHouse2ValueHelp             as projection on FacProd.packingHouse2ValueHelp;
    entity packingHouse2CountryValueHelp      as projection on FacProd.packingHouse2CountryValueHelp;
    entity packingTypeValueHelp               as projection on FacProd.packingTypeValueHelp;
    entity packageSizeValueHelp               as projection on FacProd.packageSizeValueHelp;
    entity testingHouse1ValueHelp             as projection on FacProd.testingHouse1ValueHelp;
    entity testingHouse1CountryValueHelp      as projection on FacProd.testingHouse1CountryValueHelp;
    entity testingHouse2ValueHelp             as projection on FacProd.testingHouse2ValueHelp;
    entity testingHouse2CountryValueHelp      as projection on FacProd.testingHouse2CountryValueHelp;
    entity prodDescprodtranshelp              as projection on FacProd.prodDescprodtranshelp;
    entity fbuomprodtranshelp                 as projection on FacProd.fbuomprodtranshelp;
    entity hpbuomprodtranshelp                as projection on FacProd.hpbuomprodtranshelp;
    entity motValueHelp                       as projection on FacProd.motValueHelp;
    entity coOValueHelp                       as projection on FacProd.coOValueHelp;
    entity sourcingModelValueHelp             as projection on FacProd.sourcingModelValueHelp;
    entity prodIdValueHelpProd             as projection on FacProd.prodIdValueHelpProd;
    entity prodIdValueHelpLocProd             as projection on FacProd.prodIdValueHelpLocProd;


    entity TemplateList {
       key  ID    : String;
        value : String;
    };

    type FacProdInput : {
        factoryNumber     : String(20);
        prodId            : String(50);
        prodDesc          : String(200);
        zmpaPartno        : String(50);
        zHpPartno         : String(40);
        baseunitofMeasure : String(3);
        materialType      : String(4);
        zplcStatus        : String(20);
        unspscCode        : String(9);
        zhfvType          : String(70);
        zhfvValue         : String(70);
        zintroDate        : String;
        category          : String(4);
        materialGroup     : String(9);
        gatingAttribute   : String(1);
        markedforDeletion : String(1);
        custAttr1         : String(10);
        custAttr2         : String(10);
        custAttr3         : String(10);
        custAttr4         : String;
        custAttr5         : String(20);
        custAttr6         : String(20);
        custAttr7         : String;
        custAttr8         : String;
        custAttr9         : String;
        custAttr10        : String(40);
        originalHPPN      : String(40);
    }

    type LocProdInput {
        factoryNumber        : String(20);
        locId                : String(20);
        prodId               : String(50);
        zmanuName            : String(100);
        em                   : String;
        procurementType      : String(1);
        grprocessingTime     : String;
        ztargetBuffer        : String;
        zcancelWindow        : String(12);
        planneddeliveryTime  : String;
        zinHouseLeadTime     : String;
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
        pin                  : String;
        packageSize          : String(20);
        testingHouse1        : String(100);
        testingHouse1Country : String(40);
        testingHouse2        : String(100);
        testingHouse2Country : String(40);
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

    type uomInput {
        factoryNumber : String(20);
        prodId        : String(50);
        uomAlt        : String(3);
        denominator   : String;
        numerator     : String;
        custAttr1     : String(10);
        custAttr2     : String(10);
        custAttr3     : String(10);
        custAttr4     : String;
        custAttr5     : String(20);
        custAttr6     : String(20);
        custAttr7     : String;
        custAttr8     : String;
        custAttr9     : String;
        custAttr10    : String(40);
    }

    type TransLaneInput {
        factoryNumber     : String(20);
        prodId            : String(50);
        locFr             : String(20);
        locfrType         : String(1);
        locTo             : String(20);
        loctoType         : String(1);
        mot               : String(20);
        leadTime          : String;
        coO               : String(40);
        lotSize           : String;
        moq               : String;
        pPriority         : String;
        zQuota            : String;
        spQ               : String;
        sourcingModel     : String(4);
        markedforDeletion : String(1);
        custAttr1         : String(10);
        custAttr2         : String(10);
        custAttr3         : String(10);
        custAttr4         : String;
        custAttr5         : String(20);
        custAttr6         : String(20);
        custAttr7         : String;
        custAttr8         : String;
        custAttr9         : String;
        custAttr10        : String(40);
        validFrom         : String;
        validTo           : String;
    }

    type BTPCompSequenceInput {
        seq           : String;
        zbtpComp      : String(40);
        factoryNumber : String(20);
        prodId        : String(50);
        zmpaPartno    : String(50);
        zHpPartno     : String(40);
        zoldbtpComp   : String(40);
        master        : String(10);
        status        : String(20);
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

    type MergeSplitInput {
        factoryNumber : String(20);
        prodId        : String(50);
        zmpaPartno    : String(50);
        zbtpComp      : String(40);
    }

    type TlaneDelInput {
        factoryNumber : String(20);
        prodId        : String(50);
        locFr         : String(20);
        locfrType     : String(1);
        locTo         : String(20);
        loctoType     : String(1);
        mot           : String(20);
        validTo       : String;
        validFrom     : String;
    }

    type FacProdLocDelInput {
        factoryNumber : String(20);
        prodId        : String(50);
        locId         : String(20);
    }
     
    type ProdDelInput {
        factoryNumber : String(20);
        prodId        : String(50);
        zmpaPartno    : String(50);
    }
    action   BaseUOMPosting(UserEmail : String, PostingData : LargeString, Operation : String)                                returns String;
    action   EDIConversionPosting(UserEmail : String, PostingData : LargeString, Operation : String)                          returns String;
    action   UOMConversionPosting(UserEmail : String, PostingData : LargeString, Operation : String)                          returns String;
    action   FactoryProductsMasterUpload(UserEmail : String, PostingData : array of FacProdInput, FileName : String)          returns array of ResponseType;
    action   LocProdMasterUpload(UserEmail : String, PostingData : array of LocProdInput, FileName : String)                  returns array of ResponseType;
    action   UomMasterUpload(UserEmail : String, PostingData : array of uomInput, FileName : String)                          returns array of ResponseType;
    action   TransLaneMasterUpload(UserEmail : String, PostingData : array of TransLaneInput, FileName : String)              returns array of ResponseType;
    action   TransferJob(Days : Integer, FactoryNumber : String, ServiceName : String)                                        returns array of ResponseType;
    function downloadTemplate(templateName : String)                                                                          returns String;
    action   customMasterUpload(UserEmail : String, payload : LargeString, templateName : String)                             returns array of ResponseType;
    action   merge_split(UserEmail : String, PostingData : array of MergeSplitInput, Operation : String, MergeValue : String) returns String;
    function SecurityAction()                                                                                                 returns String;
    action   MasterFlag(UserEmail : String, PostingData : array of BTPCompSequenceInput)                                      returns String;
    action   TlaneDeletionData(UserEmail : String, TlaneDelData : array of TlaneDelInput)                                     returns String;
    action   ProdLocDeletionData(UserEmail : String, ProdLocDelData : array of FacProdLocDelInput)                            returns String;
    action   ProdDeletionData(UserEmail : String, ProdDelData : array of ProdDelInput)                                        returns String;
    }