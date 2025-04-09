using {pumorips.pumoriproduct as PumoriProd} from '../db/pumoripsproduct-model';

service PumoriProductService @(requires : 'authenticated-user'){
    entity PumoriProducts @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'

        ]
    }])                                     as projection on PumoriProd.PumoriProducts;

    entity PumoriProdLoc as projection on PumoriProd.PumoriProdLoc;
    entity PumoriTranslane as projection on PumoriProd.PumoriTranslane;

    entity synFactoryProductsView @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'
        ]
    }])                                      as projection on PumoriProd.synFactoryProductsView;

    entity FactoryProductsHistoryView @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'
        ]
    }])                                       as projection on PumoriProd.FactoryProductsHistoryView;

    entity synFactoryLocationView @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'
        ]
    }])                                       as projection on PumoriProd.synFactoryLocationView;

    entity FactoryLocationsHistoryView @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'
        ]
    }])                                       as projection on PumoriProd.FactoryLocationsHistoryView;

    entity manageflag @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'

        ]
    }])                                         as projection on PumoriProd.manageflag;

    entity mappingFtFv  @(restrict: [{
        grant: ['*'],
        to   : [
            'WithCost',
            'WithoutCost',
            'WithCostview',
            'WithoutCostview'
        ]
    }])                                             as projection on PumoriProd.mappingFtFv;
    


    entity PumoriUOM                         as projection on PumoriProd.PumoriUOM;
    entity FactoryProductsHistory            as projection on PumoriProd.FactoryProductsHistory;
    entity FactoryLocationsHistory           as projection on PumoriProd.FactoryLocationsHistory;
    entity LocationProductsHistory           as projection on PumoriProd.LocationProductsHistory;
    entity UOMHistory                        as projection on PumoriProd.UOMHistory;
    entity TransLaneHistory                  as projection on PumoriProd.TranslaneHistory;
    entity MPNValueHistoryHelp               as projection on PumoriProd.MPNValueHistoryHelp;
    entity FactoryNumberHistoryValueHelp     as projection on PumoriProd.FactoryNumberHistoryValueHelp;
    entity FactoryPartNumberHistoryValueHelp as projection on PumoriProd.FactoryPartNumberHistoryValueHelp;
    entity FeatureTypeFillValueHelp          as projection on PumoriProd.FeatureTypeFillValueHelp;
    entity FeatureValueFillValueHelp         as projection on PumoriProd.FeatureValueFillValueHelp;
    entity materialTypeValueHelp             as projection on PumoriProd.materialTypeValueHelp;
    entity HpPartNumberHistoryValueHelp      as projection on PumoriProd.HpPartNumberHistoryValueHelp;
    
    entity PumoriProductsView                as projection on PumoriProd.PumoriProductsView;
    entity PumoriLocationProductsView        as projection on PumoriProd.PumoriLocationProductsView;
    entity PumoriTranslaneView               as projection on PumoriProd.PumoriTranslaneView;
    entity PumoriUOMView                     as projection on PumoriProd.PumoriUOMView;
    entity PumoriProdLocationValueHelp       as projection on PumoriProd.PumoriProdLocationValueHelp;
    entity ProdIdProdLocationValueHelp       as projection on PumoriProd.ProdIdProdLocationValueHelp;
    entity LocIdProdLocationValueHelp        as projection on PumoriProd.LocIdProdLocationValueHelp;
    entity PumoriTlaneValueHelp              as projection on PumoriProd.PumoriTlaneValueHelp;
    entity prodIdTlaneValueHelp              as projection on PumoriProd.prodIdTlaneValueHelp;
    entity locFrTlaneValueHelp               as projection on PumoriProd.locFrTlaneValueHelp;
    entity locFrTypeTlaneValueHelp           as projection on PumoriProd.locFrTypeTlaneValueHelp;
    entity locToTlaneValueHelp               as projection on PumoriProd.locToTlaneValueHelp;
    entity loctoTypeTlaneValueHelp           as projection on PumoriProd.loctoTypeTlaneValueHelp;
    entity validToTlaneValueHelp             as projection on PumoriProd.validToTlaneValueHelp;
    entity validFromTlaneValueHelp           as projection on PumoriProd.validFromTlaneValueHelp;
    entity PumoriUOMValueHelp                as projection on PumoriProd.PumoriUOMValueHelp;
    entity ProdIdUOMValueHelp                as projection on PumoriProd.ProdIdUOMValueHelp;
    entity GenHPPNValueHelp                  as projection on PumoriProd.GenHPPNValueHelp;
   
    entity ms4FTFV                           as projection on PumoriProd.ms4FTFV;
    // entity HPPNPartNumValueHelp        as projection on PumoriProd.HPPNPartNumValueHelp;
    entity mappingFtFvView                   as projection on PumoriProd.mappingFtFvView;
    entity factoryNumbermappingFtFvValueHelp as projection on PumoriProd.factoryNumbermappingFtFvValueHelp;

    entity zhfvtypeFacMappingFtFvValueHelp   as projection on PumoriProd.zhfvtypeFacMappingFtFvValueHelp;
    entity zhfvvalueFacMappingFtFvValueHelp  as projection on PumoriProd.zhfvvalueFacMappingFtFvValueHelp;
    entity zhfvtypeHPMappingFtFvValueHelp    as projection on PumoriProd.zhfvtypeHPMappingFtFvValueHelp;
    entity zhfvvalueHPMappingFtFvValueHelp   as projection on PumoriProd.zhfvvalueHPMappingFtFvValueHelp;
    
    entity viewmanageflagfthelp              as projection on PumoriProd.viewmanageflagfthelp;
    entity MPNValueHelp                      as projection on PumoriProd.MPNValueHelp;
    entity synFactoryNumberValueHelp         as projection on PumoriProd.synFactoryNumberValueHelp;
    entity FactoryPartNumberValueHelp        as projection on PumoriProd.FactoryPartNumberValueHelp;
    entity HpPartNumberValueHelp             as projection on PumoriProd.HpPartNumberValueHelp;
    entity materialTypeTexthelp              as projection on PumoriProd.materialTypeTexthelp;
    entity FTTexthelp                        as projection on PumoriProd.FTTexthelp;
    entity FVTexthelp                        as projection on PumoriProd.FVTexthelp;
   
    entity synLocationProductsView           as projection on PumoriProd.synLocationProductsView;
    entity synTranslaneView                  as projection on PumoriProd.synTranslaneView;
    entity synUOMConversionView              as projection on PumoriProd.synUOMConversionView;
    entity LoctypeTextValueHelp              as projection on PumoriProd.LoctypeTextValueHelp;
    entity PumoriProdTlaneValueHelp          as projection on PumoriProd.PumoriProdTlaneValueHelp;
    entity strategicautoFlagValueHelp        as projection on PumoriProd.strategicautoFlagValueHelp;
    entity motTlaneValueHelp                 as projection on PumoriProd.motTlaneValueHelp;
    
    
    entity synFactoryNoLocValueHelp          as projection on PumoriProd.synFactoryNoLocValueHelp;
    entity FactoryNoHistoryLocValueHelp      as projection on PumoriProd.FactoryNoHistoryLocValueHelp;
    entity FTValueHelp                       as projection on PumoriProd.FTValueHelp;
    entity FVValueHelp                       as projection on PumoriProd.FVValueHelp;
    entity matTypeValueHelp                  as projection on PumoriProd.matTypeValueHelp;
    entity zbtpCompValueHelp                 as projection on PumoriProd.zbtpCompValueHelp;
    entity prodDescValueHelp                 as projection on PumoriProd.prodDescValueHelp;
    entity baseunitofMeasureValueHelp        as projection on PumoriProd.baseunitofMeasureValueHelp;
    entity zplcStatusValueHelp               as projection on PumoriProd.zplcStatusValueHelp;
    entity unspscCodeValueHelp               as projection on PumoriProd.unspscCodeValueHelp;
    entity materialGroupValueHelp            as projection on PumoriProd.materialGroupValueHelp;
    entity gatingAttributeValueHelp          as projection on PumoriProd.gatingAttributeValueHelp;
    entity categoryValueHelp                 as projection on PumoriProd.categoryValueHelp;
    entity locIdValueHelp                    as projection on PumoriProd.locIdValueHelp;
    entity locDescrValueHelp                 as projection on PumoriProd.locDescrValueHelp;
    entity locTypeValueHelp                  as projection on PumoriProd.locTypeValueHelp;
    entity zplantTypeValueHelp               as projection on PumoriProd.zplantTypeValueHelp;
    entity locRegionValueHelp                as projection on PumoriProd.locRegionValueHelp;
    entity locationAddress1ValueHelp         as projection on PumoriProd.locationAddress1ValueHelp;
    entity locationAddress2ValueHelp         as projection on PumoriProd.locationAddress2ValueHelp;
    entity cityValueHelp                     as projection on PumoriProd.cityValueHelp;
    entity stateValueHelp                    as projection on PumoriProd.stateValueHelp;
    entity countryValueHelp                  as projection on PumoriProd.countryValueHelp;
    entity countryCodeValueHelp              as projection on PumoriProd.countryCodeValueHelp;
    entity zipcodeValueHelp                  as projection on PumoriProd.zipcodeValueHelp;
    entity locationContact1NameValueHelp     as projection on PumoriProd.locationContact1NameValueHelp;
    entity locationEmail1ValueHelp           as projection on PumoriProd.locationEmail1ValueHelp;
    entity locationContact2NameValueHelp     as projection on PumoriProd.locationContact2NameValueHelp;
    entity locationEmail2ValueHelp           as projection on PumoriProd.locationEmail2ValueHelp;
    entity prodDescValueHelppp               as projection on PumoriProd.prodDescValueHelppp;
    entity baseunitofMeasureValueHelppp      as projection on PumoriProd.baseunitofMeasureValueHelppp;
    entity zplcStatusValueHelppp             as projection on PumoriProd.zplcStatusValueHelppp;
    entity unspscCodeValueHelppp             as projection on PumoriProd.unspscCodeValueHelppp;
    entity categoryValueHelppp               as projection on PumoriProd.categoryValueHelppp;
    entity materialGroupValueHelppp          as projection on PumoriProd.materialGroupValueHelppp;
    entity gatingAttributeValueHelppp        as projection on PumoriProd.gatingAttributeValueHelppp;
    entity zcontrolCodeValueHelppp           as projection on PumoriProd.zcontrolCodeValueHelppp;
    entity zmhbigSeriesValueHelppp           as projection on PumoriProd.zmhbigSeriesValueHelppp;
    entity zmhbigseriesDescValueHelppp       as projection on PumoriProd.zmhbigseriesDescValueHelppp;
    entity zmhCategoryValueHelppp            as projection on PumoriProd.zmhCategoryValueHelppp;
    entity zmhcategoryDescValueHelppp        as projection on PumoriProd.zmhcategoryDescValueHelppp;
    entity zmhModelValueHelppp               as projection on PumoriProd.zmhModelValueHelppp;
    entity zmhmodelDescValueHelppp           as projection on PumoriProd.zmhmodelDescValueHelppp;
    entity zmhSeriesValueHelppp              as projection on PumoriProd.zmhSeriesValueHelppp;
    entity zmhseriesDescValueHelppp          as projection on PumoriProd.zmhseriesDescValueHelppp;
    entity zmhsubCategoryValueHelppp         as projection on PumoriProd.zmhsubCategoryValueHelppp;
    entity zmhsubcategoryDescValueHelppp     as projection on PumoriProd.zmhsubcategoryDescValueHelppp;
    entity zmhTypeValueHelppp                as projection on PumoriProd.zmhTypeValueHelppp;
    entity zmhtypeDescValueHelppp            as projection on PumoriProd.zmhtypeDescValueHelppp;
    entity zpchbusinessGrpValueHelppp        as projection on PumoriProd.zpchbusinessGrpValueHelppp;
    entity zpchbusinessgrpDescValueHelppp    as projection on PumoriProd.zpchbusinessgrpDescValueHelppp;
    entity zpchbusinesssubgrpValueHelppp     as projection on PumoriProd.zpchbusinesssubgrpValueHelppp;
    entity zpchbusinesssubgrpDescValueHelppp as projection on PumoriProd.zpchbusinesssubgrpDescValueHelppp;
    entity zpchextSegmentValueHelppp         as projection on PumoriProd.zpchextSegmentValueHelppp;
    entity zpchextsegmentDescValueHelppp     as projection on PumoriProd.zpchextsegmentDescValueHelppp;
    entity zpchgBuValueHelppp                as projection on PumoriProd.zpchgBuValueHelppp;
    entity zpchgBuDescValueHelppp            as projection on PumoriProd.zpchgBuDescValueHelppp;
    entity zpchhpCompanyValueHelppp          as projection on PumoriProd.zpchhpCompanyValueHelppp;
    entity zpchhpcompanyDescValueHelppp      as projection on PumoriProd.zpchhpcompanyDescValueHelppp;
    entity zpchprdcategoryDescValueHelppp    as projection on PumoriProd.zpchprdcategoryDescValueHelppp;
    entity zpchprofitCenterValueHelppp       as projection on PumoriProd.zpchprofitCenterValueHelppp;
    entity zpchprofitcenterDescValueHelppp   as projection on PumoriProd.zpchprofitcenterDescValueHelppp;
    entity zspPlValueHelppp                  as projection on PumoriProd.zspPlValueHelppp;
    entity languagekeyValueHelppp            as projection on PumoriProd.languagekeyValueHelppp;
    entity zmpnValueHelp                     as projection on PumoriProd.zmpnValueHelp;
    entity zmpaPartnoValueHelp               as projection on PumoriProd.zmpaPartnoValueHelp;
    entity procurementTypeValueHelp          as projection on PumoriProd.procurementTypeValueHelp;
    entity zmanuNameValueHelp                as projection on PumoriProd.zmanuNameValueHelp;
    entity zcancelWindowValueHelp            as projection on PumoriProd.zcancelWindowValueHelp;
    entity soleSourceFlagValueHelp           as projection on PumoriProd.soleSourceFlagValueHelp;
    entity outSourceValueHelp                as projection on PumoriProd.outSourceValueHelp;
    entity foundry1ValueHelp                 as projection on PumoriProd.foundry1ValueHelp;
    entity foundry1SiteValueHelp             as projection on PumoriProd.foundry1SiteValueHelp;
    entity foundry1CountryValueHelp          as projection on PumoriProd.foundry1CountryValueHelp;
    entity foundry2ValueHelp                 as projection on PumoriProd.foundry2ValueHelp;
    entity foundry2SiteValueHelp             as projection on PumoriProd.foundry2SiteValueHelp;
    entity foundry2CountryValueHelp          as projection on PumoriProd.foundry2CountryValueHelp;
    entity waferSizeValueHelp                as projection on PumoriProd.waferSizeValueHelp;
    entity nodeProcessValueHelp              as projection on PumoriProd.nodeProcessValueHelp;
    entity nodeProcessGroupValueHelp         as projection on PumoriProd.nodeProcessGroupValueHelp;
    entity packingHouse1ValueHelp            as projection on PumoriProd.packingHouse1ValueHelp;
    entity packingHouse1CountryValueHelp     as projection on PumoriProd.packingHouse1CountryValueHelp;
    entity packingHouse2ValueHelp            as projection on PumoriProd.packingHouse2ValueHelp;
    entity packingHouse2CountryValueHelp     as projection on PumoriProd.packingHouse2CountryValueHelp;
    entity packingTypeValueHelp              as projection on PumoriProd.packingTypeValueHelp;
    entity packageSizeValueHelp              as projection on PumoriProd.packageSizeValueHelp;
    entity testingHouse1ValueHelp            as projection on PumoriProd.testingHouse1ValueHelp;
    entity testingHouse1CountryValueHelp     as projection on PumoriProd.testingHouse1CountryValueHelp;
    entity testingHouse2ValueHelp            as projection on PumoriProd.testingHouse2ValueHelp;
    entity testingHouse2CountryValueHelp     as projection on PumoriProd.testingHouse2CountryValueHelp;
    entity lvormValueHelp                    as projection on PumoriProd.lvormValueHelp;
    entity reqstratValueHelp                 as projection on PumoriProd.reqstratValueHelp;
    entity fxhorValueHelp                    as projection on PumoriProd.fxhorValueHelp;
    entity plannerNameValueHelp              as projection on PumoriProd.plannerNameValueHelp;
    entity shflgValueHelp                    as projection on PumoriProd.shflgValueHelp;
    entity sobslValueHelp                    as projection on PumoriProd.sobslValueHelp;
    entity mmstaValueHelp                    as projection on PumoriProd.mmstaValueHelp;
    entity dismmValueHelp                    as projection on PumoriProd.dismmValueHelp;
    entity dislsValueHelp                    as projection on PumoriProd.dislsValueHelp;
    entity fhoriValueHelp                    as projection on PumoriProd.fhoriValueHelp;
    entity ekgrpValueHelp                    as projection on PumoriProd.ekgrpValueHelp;
    entity kzausValueHelp                    as projection on PumoriProd.kzausValueHelp;
    entity ausdtValueHelp                    as projection on PumoriProd.ausdtValueHelp;
    entity atpkzValueHelp                    as projection on PumoriProd.atpkzValueHelp;
    entity prctrValueHelp                    as projection on PumoriProd.prctrValueHelp;
    entity nfmatValueHelp                    as projection on PumoriProd.nfmatValueHelp;
    entity prodIdHistoryValueHelp            as projection on PumoriProd.prodIdHistoryValueHelp;
    entity synprodIdValueHelp                as projection on PumoriProd.synprodIdValueHelp;
    entity zmpaPartnotValueHelp              as projection on PumoriProd.zmpaPartnotValueHelp;
    entity EKORGValueHelp                    as projection on PumoriProd.EKORGValueHelp;
    entity INFNRValueHelp                    as projection on PumoriProd.INFNRValueHelp;
    entity TRANS_CALENDARValueHelp           as projection on PumoriProd.TRANS_CALENDARValueHelp;
    type PumoriStrategicInput {
        prodId            : String(40);
        strategicautoFlag : String(1);
        response          : String(1);
    }

    type MappingFtFvInput : {
        factoryNumber : String(4);
        zhfvtypeFac   : String(70);
        zhfvtypeHP    : String(70);
        zhfvvalueFac  : String(70);
        zhfvvalueHP   : String(70);
        default       : String(1);
    }

    type ManageFlagInput  : {
        zhfvType          : String(70);
        Strategicautoflag : String(1);
        response          : String(1);
    }

    type ManageFlagRespInput  : {
        zhfvType          : String(70);
        response          : String(1);
    }

    type PumoriProdResponseInput :{
        prodId          : String(40);
        response        : String(1);
    }

    //success response type for bulkupload
    type Success          : {
        totalRecords           : String;
        updated                : String;
        created                : String;
        deleted                : String;
        pumorilocation_updated : String;
        deletedUOM             : String;
        deletedProdLocRows     : String;
        deletedTLaneRows       : String;
        deletedNotExistInLoc   : String;
    }

    type Error            : {
        errorFields : String;
    }

    //response type for bulkupload
    type ResponseType     : {
        success : Success;
        error   : Error;
    }

    type FlushFillProdInput {
        factoryNumber : String(20);
        prodId        : String(50);
        snapshotDate  : String;
    }

    type FlushFillLocInput {
        factoryNumber : String(20);
        locId         : String(50);
        locType       : String(1);
        snapshotDate  : String;
    }

    type HpFtResponseInput:{
        factoryNumber : String(20);
        zhfvtypeFac   : String(70);
        zhfvtypeHP    : String(70);
    }

    action   PumoriStrategic(UserEmail : String, PostingData : array of PumoriStrategicInput)                    returns String;
    action   UpdatePumoriProd(UserEmail : String, ProdData : LargeString)                                        returns String;
    action   PumoriProductsMasterUpload(Days : Integer, FactoryNumber : String)                                  returns array of ResponseType;
    action   PumoriProdLocMasterUpload(Days : Integer, FactoryNumber : String)                                   returns array of ResponseType;
    action   PumoriTranslaneMasterUpload(Days : Integer, FactoryNumber : String)                                 returns array of ResponseType;
    action   PumoriUOMMasterUpload(Days : Integer, FactoryNumber : String)                                       returns array of ResponseType;
    action   UpdateFlagDetail(UserEmail : String, FlagUpdateData : LargeString)                                  returns String;
    action   ManageFlag(PostingData : array of ManageFlagInput, UserEmail : String)                              returns String;
    action   ManageFlagResponse(PostingData : array of ManageFlagRespInput, UserEmail : String)                  returns String;
    action   flushAndFillProd(PostingData : array of FlushFillProdInput, Operation : String, UserEmail : String) returns String;
    action   flushAndFillLoc(PostingData : array of FlushFillLocInput, Operation : String, UserEmail : String)   returns String;
    function ftfvload()                                                                                          returns String;
    action   UpdatePumoriProdftfv(ProdData : LargeString, UserEmail : String)                                    returns String;
    action   PumoriProdResponse(PostingData: array of PumoriProdResponseInput,UserEmail : String)                returns String;
    function SecurityAction()                                                                                    returns String;
    function HistoryTableLoad()                                                                                  returns String;
    action   UpdateHpFtResponse(PostingData: array of HpFtResponseInput, UserEmail:String)                       returns String;
}