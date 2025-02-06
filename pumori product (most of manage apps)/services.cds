using from './pumoriprodui/annotations';
using from './mapftfvui/annotations';
using from './flushandfillui/annotations';
using from './manageflagui/annotations';
using from './pumoriprodlocui/annotations';
using from './pumoriprodtlane/annotations';

annotate PumoriProductService.PumoriProductsView with {
    prodId                 @(title: '{i18n>genHPPN}');
    prodDesc               @(title: '{i18n>prdDesc}');
    materialType           @(title: '{i18n>matType}');
    markedforDeletion      @(title: '{i18n>markdel}');
    baseunitofMeasure      @(title: '{i18n>buom}');
    strategicautoFlag      @(title: '{i18n>Stratgicatoflg}');
    zhfvType               @(title: '{i18n>featureType}');
    zhfvValue              @(title: '{i18n>featureValue}');
    zplcStatus             @(title: '{i18n>zplcStatus}');
    unspscCode             @(title: '{i18n>unspscCode}');
    zintroDate             @(title: '{i18n>zintroDate}');
    category               @(title: '{i18n>category}');
    materialGroup          @(title: '{i18n>matGrp}');
    gatingAttribute        @(title: '{i18n>gatingAttribute}');
    zcontrolCode           @(title: '{i18n>ctlCd}');
    zmhbigSeries           @(title: '{i18n>bgsrs}');
    zmhbigseriesDesc       @(title: '{i18n>bgsrsdesc}');
    zmhCategory            @(title: '{i18n>mhcat}');
    zmhcategoryDesc        @(title: '{i18n>mhcatdesc}');
    zmhModel               @(title: '{i18n>mhmdl}');
    zmhmodelDesc           @(title: '{i18n>mhmdldesc}');
    zmhSeries              @(title: '{i18n>mhsrs}');
    zmhseriesDesc          @(title: '{i18n>mhsrsdesc}');
    zmhsubCategory         @(title: '{i18n>mhsbct}');
    zmhsubcategoryDesc     @(title: '{i18n>mhsbctdesc}');
    zmhType                @(title: '{i18n>mhtyp}');
    zmhtypeDesc            @(title: '{i18n>mhtypdesc}');
    zpchbusinessGrp        @(title: '{i18n>pchbg}');
    zpchbusinessgrpDesc    @(title: '{i18n>pchbgdesc}');
    zpchbusinesssubgrp     @(title: '{i18n>pchbgsub}');
    zpchbusinesssubgrpDesc @(title: '{i18n>pchbgsubdesc}');
    zpchextSegment         @(title: '{i18n>extseg}');
    zpchextsegmentDesc     @(title: '{i18n>extsegdesc}');
    zpchgBu                @(title: '{i18n>pchGbu}');
    zpchgBuDesc            @(title: '{i18n>pchGbuDesc}');
    zpchhpCompany          @(title: '{i18n>pchHpCom}');
    zpchhpcompanyDesc      @(title: '{i18n>pchHpComDesc}');
    zpchprdcategoryDesc    @(title: '{i18n>pchPrdDes}');
    zpchprofitCenter       @(title: '{i18n>prftCntr}');
    zpchprofitcenterDesc   @(title: '{i18n>prftCntrDesc}');
    zspPl                  @(title: '{i18n>sppl}');
    languagekey            @(title: '{i18n>lKey}');
    keeperFlag             @(title: '{i18n>kepFlg}');
    response               @(title: '{i18n>response}');
    @UI.HiddenFilter response;
    @UI.HiddenFilter keeperFlag;
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;

}
/* Annotation for pumori product value help */

annotate PumoriProductService.strategicautoFlagValueHelp with {
    strategicautoFlag @(title: '{i18n>Stratgicatoflg}');
}

annotate PumoriProductService.FTValueHelp with {
    zhfvType @(title: '{i18n>featureType}');
}

annotate PumoriProductService.FVValueHelp with {
    zhfvValue @(title: '{i18n>featureValue}');
}

annotate PumoriProductService.matTypeValueHelp with {
    materialType @(title: '{i18n>matType}');
}

annotate PumoriProductService.prodDescValueHelppp with {
    prodDesc               @(title: '{i18n>prdDesc}');
}

annotate PumoriProductService.baseunitofMeasureValueHelppp with {
    baseunitofMeasure      @(title: '{i18n>buom}');
}

annotate PumoriProductService.zplcStatusValueHelppp with {
    zplcStatus             @(title: '{i18n>zplcStatus}');
}

annotate PumoriProductService.unspscCodeValueHelppp with {
    unspscCode             @(title: '{i18n>unspscCode}');
}

annotate PumoriProductService.categoryValueHelppp with {
    category               @(title: '{i18n>category}');
}

annotate PumoriProductService.materialGroupValueHelppp with {
    materialGroup          @(title: '{i18n>matGrp}');
}

annotate PumoriProductService.gatingAttributeValueHelppp with {
    gatingAttribute        @(title: '{i18n>gatingAttribute}');
}

annotate PumoriProductService.zcontrolCodeValueHelppp with {
    zcontrolCode           @(title: '{i18n>ctlCd}');
}

annotate PumoriProductService.zmhbigSeriesValueHelppp with {
    zmhbigSeries           @(title: '{i18n>mhbigsrs}');
}

annotate PumoriProductService.zmhbigseriesDescValueHelppp with {
    zmhbigseriesDesc       @(title: '{i18n>mhbigsrsDesc}');
}

annotate PumoriProductService.zmhCategoryValueHelppp with {
    zmhCategory            @(title: '{i18n>mhcat}');
}

annotate PumoriProductService.zmhcategoryDescValueHelppp with {
    zmhcategoryDesc        @(title: '{i18n>mhcatdesc}');
}

annotate PumoriProductService.zmhModelValueHelppp with {
    zmhModel               @(title: '{i18n>mhmdl}');
}

annotate PumoriProductService.zmhmodelDescValueHelppp with {
    zmhmodelDesc           @(title: '{i18n>mhmdldesc}');
}

annotate PumoriProductService.zmhSeriesValueHelppp with {
    zmhSeries              @(title: '{i18n>mhsrs}');
}

annotate PumoriProductService.zmhseriesDescValueHelppp with {
    zmhseriesDesc          @(title: '{i18n>mhsrsdesc}');
}

annotate PumoriProductService.zmhsubCategoryValueHelppp with {
    zmhsubCategory         @(title: '{i18n>mhsbct}');
}

annotate PumoriProductService.zmhsubcategoryDescValueHelppp with {
    zmhsubcategoryDesc     @(title: '{i18n>mhsbctdesc}');
}

annotate PumoriProductService.zmhTypeValueHelppp with {
    zmhType                @(title: '{i18n>mhtyp}');
}

annotate PumoriProductService.zmhtypeDescValueHelppp with {
    zmhtypeDesc            @(title: '{i18n>mhtypdesc}');
}

annotate PumoriProductService.zpchbusinessGrpValueHelppp with {
    zpchbusinessGrp        @(title: '{i18n>pchbg}');
}

annotate PumoriProductService.zpchbusinessgrpDescValueHelppp with {
    zpchbusinessgrpDesc    @(title: '{i18n>pchbgdesc}');
}

annotate PumoriProductService.zpchbusinesssubgrpValueHelppp with {
    zpchbusinesssubgrp     @(title: '{i18n>pchbgsub}');
}

annotate PumoriProductService.zpchbusinesssubgrpDescValueHelppp with {
    zpchbusinesssubgrpDesc @(title: '{i18n>pchbgsubdesc}');
}

annotate PumoriProductService.zpchextSegmentValueHelppp with {
    zpchextSegment         @(title: '{i18n>extseg}');
}

annotate PumoriProductService.zpchextsegmentDescValueHelppp with {
    zpchextsegmentDesc     @(title: '{i18n>extsegdesc}');
}

annotate PumoriProductService.zpchgBuValueHelppp with {
    zpchgBu                @(title: '{i18n>pchGbu}');
}

annotate PumoriProductService.zpchgBuDescValueHelppp with {
    zpchgBuDesc            @(title: '{i18n>pchGbuDesc}');
}

annotate PumoriProductService.zpchhpCompanyValueHelppp with {
    zpchhpCompany          @(title: '{i18n>pchHpCom}');
}

annotate PumoriProductService.zpchhpcompanyDescValueHelppp with {
    zpchhpcompanyDesc      @(title: '{i18n>pchHpComDesc}');
}

annotate PumoriProductService.zpchprdcategoryDescValueHelppp with {
    zpchprdcategoryDesc    @(title: '{i18n>pchPrdDes}');
}

annotate PumoriProductService.zpchprofitCenterValueHelppp with {
    zpchprofitCenter       @(title: '{i18n>prftCntr}');
}

annotate PumoriProductService.zpchprofitcenterDescValueHelppp with {
    zpchprofitcenterDesc   @(title: '{i18n>prftCntrDesc}');
}

annotate PumoriProductService.zspPlValueHelppp with {
    zspPl                  @(title: '{i18n>sppl}');
} 

annotate PumoriProductService.languagekeyValueHelppp with {
    languagekey            @(title: '{i18n>lKey}');
}


/* End of Annotation for pumori product value help */
annotate PumoriProductService.PumoriProductsView with @(UI: {
    SelectionFields: [
        prodId,
        materialType,
        strategicautoFlag,
        zhfvType,
        zhfvValue
    ],
    LineItem       : [
        {
            Value: prodId,
            Label: '{i18n>genHPPN}',
        },
        {
            Value: prodDesc,
            Label: '{i18n>prdDesc}'
        },
        {
            Value: materialType,
            Label: '{i18n>matType}'
        },
        {
            Value: baseunitofMeasure,
            Label: '{i18n>buom}'
        },
        {
            Value: strategicautoFlag,
            Label: '{i18n>Stratgicatoflg}'
        },
        {
            Value: zhfvType,
            Label: '{i18n>featureType}'
        },
        {
            Value: zhfvValue,
            Label: '{i18n>featureValue}'
        },
        {
            Value: response,
            Label: '{i18n>response}'
        }
    ]
}) {
    prodId            @(Common: {
        Text     : {
            $value                : prodId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : prodId,
            CollectionPath : 'GenHPPNValueHelp',
            Parameters     : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: prodId,
                    ValueListProperty: 'prodId'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'prodDesc'
                }
            ]
        }
    });
    materialType      @(Common: {
        Text     : {
            $value                : materialType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : materialType,
            CollectionPath : 'matTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: materialType,
                ValueListProperty: 'materialType'
            }]
        }
    });
    zhfvType          @(Common: {
        Text     : {
            $value                : zhfvType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureType}',
            CollectionPath : 'FTValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvType,
                ValueListProperty: 'zhfvType'
            }]
        }
    });
    zhfvValue         @(Common: {
        Text     : {
            $value                : zhfvValue,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureValue}',
            CollectionPath : 'FVValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvValue,
                ValueListProperty: 'zhfvValue'
            }]
        }
    });
    strategicautoFlag @(Common: {
        Text                    : {
            $value                : strategicautoFlag,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : strategicautoFlag,
            CollectionPath : 'strategicautoFlagValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: strategicautoFlag,
                ValueListProperty: 'strategicautoFlag'
            }]
        },
        ValueListWithFixedValues: true
    });

    prodDesc @(Common: {
        Text                    : {
            $value                : prodDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : prodDesc,
            CollectionPath : 'prodDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodDesc,
                ValueListProperty: 'prodDesc'
            }]
        }
    });
    baseunitofMeasure @(Common: {
        Text                    : {
            $value                : baseunitofMeasure,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : baseunitofMeasure,
            CollectionPath : 'baseunitofMeasureValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: baseunitofMeasure,
                ValueListProperty: 'baseunitofMeasure'
            }]
        }
    });
    zplcStatus @(Common: {
        Text                    : {
            $value                : zplcStatus,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zplcStatus,
            CollectionPath : 'zplcStatusValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zplcStatus,
                ValueListProperty: 'zplcStatus'
            }]
        }
    });
    unspscCode @(Common: {
        Text                    : {
            $value                : unspscCode,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : unspscCode,
            CollectionPath : 'unspscCodeValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: unspscCode,
                ValueListProperty: 'unspscCode'
            }]
        }
    });
    category @(Common: {
        Text                    : {
            $value                : category,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : category,
            CollectionPath : 'categoryValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: category,
                ValueListProperty: 'category'
            }]
        }
    });
    materialGroup @(Common: {
        Text                    : {
            $value                : materialGroup,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : materialGroup,
            CollectionPath : 'materialGroupValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: materialGroup,
                ValueListProperty: 'materialGroup'
            }]
        }
    });
    gatingAttribute @(Common: {
        Text                    : {
            $value                : gatingAttribute,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : gatingAttribute,
            CollectionPath : 'gatingAttributeValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: gatingAttribute,
                ValueListProperty: 'gatingAttribute'
            }]
        }
    });
    zcontrolCode @(Common: {
        Text                    : {
            $value                : zcontrolCode,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zcontrolCode,
            CollectionPath : 'zcontrolCodeValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zcontrolCode,
                ValueListProperty: 'zcontrolCode'
            }]
        }
    });
    zmhbigSeries @(Common: {
        Text                    : {
            $value                : zmhbigSeries,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhbigSeries,
            CollectionPath : 'zmhbigSeriesValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhbigSeries,
                ValueListProperty: 'zmhbigSeries'
            }]
        }
    });
    zmhbigseriesDesc @(Common: {
        Text                    : {
            $value                : zmhbigseriesDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhbigseriesDesc,
            CollectionPath : 'zmhbigseriesDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhbigseriesDesc,
                ValueListProperty: 'zmhbigseriesDesc'
            }]
        }
    });
    zmhCategory @(Common: {
        Text                    : {
            $value                : zmhCategory,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhCategory,
            CollectionPath : 'zmhCategoryValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhCategory,
                ValueListProperty: 'zmhCategory'
            }]
        }
    });
    zmhcategoryDesc @(Common: {
        Text                    : {
            $value                : zmhcategoryDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhcategoryDesc,
            CollectionPath : 'zmhcategoryDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhcategoryDesc,
                ValueListProperty: 'zmhcategoryDesc'
            }]
        }
    });
    zmhModel @(Common: {
        Text                    : {
            $value                : zmhModel,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhModel,
            CollectionPath : 'zmhModelValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhModel,
                ValueListProperty: 'zmhModel'
            }]
        }
    });
    zmhmodelDesc @(Common: {
        Text                    : {
            $value                : zmhmodelDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhmodelDesc,
            CollectionPath : 'zmhmodelDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhmodelDesc,
                ValueListProperty: 'zmhmodelDesc'
            }]
        }
    });
    zmhSeries @(Common: {
        Text                    : {
            $value                : zmhSeries,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhSeries,
            CollectionPath : 'zmhSeriesValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhSeries,
                ValueListProperty: 'zmhSeries'
            }]
        }
    });
    zmhseriesDesc @(Common: {
        Text                    : {
            $value                : zmhseriesDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhseriesDesc,
            CollectionPath : 'zmhseriesDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhseriesDesc,
                ValueListProperty: 'zmhseriesDesc'
            }]
        }
    });
    zmhsubCategory @(Common: {
        Text                    : {
            $value                : zmhsubCategory,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhsubCategory,
            CollectionPath : 'zmhsubCategoryValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhsubCategory,
                ValueListProperty: 'zmhsubCategory'
            }]
        }
    });
    zmhsubcategoryDesc @(Common: {
        Text                    : {
            $value                : zmhsubcategoryDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhsubcategoryDesc,
            CollectionPath : 'zmhsubcategoryDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhsubcategoryDesc,
                ValueListProperty: 'zmhsubcategoryDesc'
            }]
        }
    });
    zmhType @(Common: {
        Text                    : {
            $value                : zmhType,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhType,
            CollectionPath : 'zmhTypeValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhType,
                ValueListProperty: 'zmhType'
            }]
        }
    });
    zmhtypeDesc @(Common: {
        Text                    : {
            $value                : zmhtypeDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zmhtypeDesc,
            CollectionPath : 'zmhtypeDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmhtypeDesc,
                ValueListProperty: 'zmhtypeDesc'
            }]
        }
    });
    zpchbusinessGrp @(Common: {
        Text                    : {
            $value                : zpchbusinessGrp,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchbusinessGrp,
            CollectionPath : 'zpchbusinessGrpValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchbusinessGrp,
                ValueListProperty: 'zpchbusinessGrp'
            }]
        }
    });
    zpchbusinessgrpDesc @(Common: {
        Text                    : {
            $value                : zpchbusinessgrpDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchbusinessgrpDesc,
            CollectionPath : 'zpchbusinessgrpDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchbusinessgrpDesc,
                ValueListProperty: 'zpchbusinessgrpDesc'
            }]
        }
    });
    zpchbusinesssubgrp @(Common: {
        Text                    : {
            $value                : zpchbusinesssubgrp,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchbusinesssubgrp,
            CollectionPath : 'zpchbusinesssubgrpValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchbusinesssubgrp,
                ValueListProperty: 'zpchbusinesssubgrp'
            }]
        }
    });
    zpchbusinesssubgrpDesc @(Common: {
        Text                    : {
            $value                : zpchbusinesssubgrpDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchbusinesssubgrpDesc,
            CollectionPath : 'zpchbusinesssubgrpDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchbusinesssubgrpDesc,
                ValueListProperty: 'zpchbusinesssubgrpDesc'
            }]
        }
    });
    zpchextSegment @(Common: {
        Text                    : {
            $value                : zpchextSegment,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchextSegment,
            CollectionPath : 'zpchextSegmentValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchextSegment,
                ValueListProperty: 'zpchextSegment'
            }]
        }
    });
    zpchextsegmentDesc @(Common: {
        Text                    : {
            $value                : zpchextsegmentDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchextsegmentDesc,
            CollectionPath : 'zpchextsegmentDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchextsegmentDesc,
                ValueListProperty: 'zpchextsegmentDesc'
            }]
        }
    });
    zpchgBu @(Common: {
        Text                    : {
            $value                : zpchgBu,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchgBu,
            CollectionPath : 'zpchgBuValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchgBu,
                ValueListProperty: 'zpchgBu'
            }]
        }
    });
    zpchgBuDesc @(Common: {
        Text                    : {
            $value                : zpchgBuDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchgBuDesc,
            CollectionPath : 'zpchgBuDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchgBuDesc,
                ValueListProperty: 'zpchgBuDesc'
            }]
        }
    });
    zpchhpCompany @(Common: {
        Text                    : {
            $value                : zpchhpCompany,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchhpCompany,
            CollectionPath : 'zpchhpCompanyValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchhpCompany,
                ValueListProperty: 'zpchhpCompany'
            }]
        }
    });
    zpchhpcompanyDesc @(Common: {
        Text                    : {
            $value                : zpchhpcompanyDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchhpcompanyDesc,
            CollectionPath : 'zpchhpcompanyDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchhpcompanyDesc,
                ValueListProperty: 'zpchhpcompanyDesc'
            }]
        }
    });
    zpchprdcategoryDesc @(Common: {
        Text                    : {
            $value                : zpchprdcategoryDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchprdcategoryDesc,
            CollectionPath : 'zpchprdcategoryDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchprdcategoryDesc,
                ValueListProperty: 'zpchprdcategoryDesc'
            }]
        }
    });
    zpchprofitCenter @(Common: {
        Text                    : {
            $value                : zpchprofitCenter,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchprofitCenter,
            CollectionPath : 'zpchprofitCenterValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchprofitCenter,
                ValueListProperty: 'zpchprofitCenter'
            }]
        }
    });
    zpchprofitcenterDesc @(Common: {
        Text                    : {
            $value                : zpchprofitcenterDesc,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zpchprofitcenterDesc,
            CollectionPath : 'zpchprofitcenterDescValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zpchprofitcenterDesc,
                ValueListProperty: 'zpchprofitcenterDesc'
            }]
        }
    });
    zspPl @(Common: {
        Text                    : {
            $value                : zspPl,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : zspPl,
            CollectionPath : 'zspPlValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zspPl,
                ValueListProperty: 'zspPl'
            }]
        }
    });
    languagekey @(Common: {
        Text                    : {
            $value                : languagekey,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : languagekey,
            CollectionPath : 'languagekeyValueHelppp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: languagekey,
                ValueListProperty: 'languagekey'
            }]
        }
    });
};

annotate PumoriProductService.GenHPPNValueHelp with {
    prodId   @(title: '{i18n>genHPPN}');
    prodDesc @(title: '{i18n>prdDesc}');
}

annotate PumoriProductService.PumoriUOM with {
    prodId      @(title: '{i18n>genHPPN}');
    uomAlt      @(title: '{i18n>uomlt}');
    denominator @(title: '{i18n>den}');
    numerator   @(title: '{i18n>num}');
    @UI.HiddenFilter custAttr1;
    @UI.HiddenFilter custAttr2;
    @UI.HiddenFilter custAttr3;
    @UI.HiddenFilter custAttr4;
    @UI.HiddenFilter custAttr5;
    @UI.HiddenFilter custAttr6;
    @UI.HiddenFilter custAttr7;
    @UI.HiddenFilter custAttr8;
    @UI.HiddenFilter custAttr9;
    @UI.HiddenFilter custAttr10;
}

annotate PumoriProductService.PumoriUOM with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>genHPPN}'
    },
    {
        Value: uomAlt,
        Label: '{i18n>uomlt}'
    },
    {
        Value: denominator,
        Label: '{i18n>den}'
    },
    {
        Value: numerator,
        Label: '{i18n>num}'
    },
]});

annotate PumoriProductService.PumoriUOMValueHelp with {
    uomAlt @(title: '{i18n>uomlt}');
}

annotate PumoriProductService.ProdIdUOMValueHelp with {
    prodId @(title: '{i18n>genHPPN}');
}


annotate PumoriProductService.PumoriLocationProductsView with {
    locId                @(title: '{i18n>locid}');
    prodId               @(title: '{i18n>genHPPN}');
    zmpn                 @(title: '{i18n>zmpn}');
    zmpaPartno           @(title: '{i18n>zmpaPartno}');
    LOCTYPETEXT          @(title: '{i18n>loctype}');
    procurementType      @(title: '{i18n>proctype}');
    grprocessingTime     @(title: '{i18n>grprocessingTime}');
    ztargetBuffer        @(title: '{i18n>SztargetBuffer}');
    zmanuName            @(title: '{i18n>manName}');
    em                   @(title: '{i18n>em}');
    zcancelWindow        @(title: '{i18n>cnWin}');
    planneddeliveryTime  @(title: '{i18n>plnDelTm}');
    zinHouseLeadTime     @(title: '{i18n>zinHouseLeadTime}');
    soleSourceFlag       @(title: '{i18n>soleSourceFlag}');
    outSource            @(title: '{i18n>outSource}');
    foundry1             @(title: '{i18n>foundry1}');
    foundry1Site         @(title: '{i18n>foundry1Site}');
    foundry1Country      @(title: '{i18n>foundry1Country}');
    foundry2             @(title: '{i18n>foundry2}');
    foundry2Site         @(title: '{i18n>foundry2Site}');
    foundry2Country      @(title: '{i18n>foundry2Country}');
    waferSize            @(title: '{i18n>waferSize}');
    nodeProcess          @(title: '{i18n>nodeProcess}');
    nodeProcessGroup     @(title: '{i18n>nodeProcessGroup}');
    packingHouse1        @(title: '{i18n>packingHouse1}');
    packingHouse1Country @(title: '{i18n>packingHouse1Country}');
    packingHouse2        @(title: '{i18n>packingHouse2}');
    packingHouse2Country @(title: '{i18n>packingHouse2Country}');
    packingType          @(title: '{i18n>packingType}');
    pin                  @(title: '{i18n>pin}');
    packageSize          @(title: '{i18n>packageSize}');
    testingHouse1        @(title: '{i18n>testingHouse1}');
    testingHouse1Country @(title: '{i18n>testingHouse1Country}');
    testingHouse2        @(title: '{i18n>testingHouse2}');
    testingHouse2Country @(title: '{i18n>testingHouse2Country}');
    markedforDeletion    @(title: '{i18n>markdel}');
    plannerName          @(title: '{i18n>plnrNm}');
    safetystockMd        @(title: '{i18n>sftdays}');
    dzeit                @(title: '{i18n>dZeit}');
    reqstrat             @(title: '{i18n>reqStrat}');
    lvorm                @(title: '{i18n>LVORM}');
    fxhor                @(title: '{i18n>FXHOR}');
    shflg                @(title: '{i18n>SHFLG}');
    shzet                @(title: '{i18n>SHZET}');
    sobsl                @(title: '{i18n>SOBSL}');
    ausss                @(title: '{i18n>AUSSS}');
    mmsta                @(title: '{i18n>MMSTA}');
    dismm                @(title: '{i18n>DISMM}');
    disls                @(title: '{i18n>DISLS}');
    fhori                @(title: '{i18n>FHORI}');
    bstrf                @(title: '{i18n>BSTRF}');
    ekgrp                @(title: '{i18n>EKGRP}');
    kzaus                @(title: '{i18n>KZAUS}');
    ausdt                @(title: '{i18n>AUSDT}');
    atpkz                @(title: '{i18n>ATPKZ}');
    bstmi                @(title: '{i18n>BSTMI}');
    bstma                @(title: '{i18n>BSTMA}');
    eislo                @(title: '{i18n>EISLO}');
    prctr                @(title: '{i18n>PRCTR}');
    stprs                @(title: '{i18n>STPRS}');
    nfmat                @(title: '{i18n>NFMAT}');
    @UI.HiddenFilter locType;
    @UI.Hidden locType;
    @UI.HiddenFilter LOCTYPETEXT;
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.LocIdProdLocationValueHelp with {
    locId @(title: '{i18n>locid}');

}

annotate PumoriProductService.ProdIdProdLocationValueHelp with {
    prodId @(title: '{i18n>genHPPN}');

}

annotate PumoriProductService.zmpnValueHelp with {
    zmpn                 @(title: '{i18n>zmpn}');

}

annotate PumoriProductService.zmpaPartnoValueHelp with {
    zmpaPartno           @(title: '{i18n>zmpaPartno}');

}

annotate PumoriProductService.procurementTypeValueHelp with {
    procurementType      @(title: '{i18n>proctype}');

}
annotate PumoriProductService.zmanuNameValueHelp with {
    zmanuName            @(title: '{i18n>manName}');

}
annotate PumoriProductService.zcancelWindowValueHelp with {
    zcancelWindow        @(title: '{i18n>cnWin}');

}
annotate PumoriProductService.soleSourceFlagValueHelp with {
    soleSourceFlag       @(title: '{i18n>soleSourceFlag}');

}
annotate PumoriProductService.outSourceValueHelp with {
    outSource            @(title: '{i18n>outSource}');

}
annotate PumoriProductService.foundry1ValueHelp with {
    foundry1             @(title: '{i18n>foundry1}');

}
annotate PumoriProductService.foundry1SiteValueHelp with {
    foundry1Site         @(title: '{i18n>foundry1Site}');

}
annotate PumoriProductService.foundry1CountryValueHelp with {
    foundry1Country      @(title: '{i18n>foundry1Country}');

}
annotate PumoriProductService.foundry2ValueHelp with {
    foundry2             @(title: '{i18n>foundry2}');

}
annotate PumoriProductService.foundry2SiteValueHelp with {
    foundry2Site         @(title: '{i18n>foundry2Site}');

}
annotate PumoriProductService.foundry2CountryValueHelp with {
    foundry2Country      @(title: '{i18n>foundry2Country}');

}
annotate PumoriProductService.waferSizeValueHelp with {
    waferSize            @(title: '{i18n>waferSize}');

}
annotate PumoriProductService.nodeProcessValueHelp with {
    nodeProcess          @(title: '{i18n>nodeProcess}');

}
annotate PumoriProductService.nodeProcessGroupValueHelp with {
    nodeProcessGroup     @(title: '{i18n>nodeProcessGroup}');

}
annotate PumoriProductService.packingHouse1ValueHelp with {
    packingHouse1        @(title: '{i18n>packingHouse1}');

}
annotate PumoriProductService.packingHouse1CountryValueHelp with {
    packingHouse1Country @(title: '{i18n>packingHouse1Country}');

}
annotate PumoriProductService.packingHouse2ValueHelp with {
    packingHouse2        @(title: '{i18n>packingHouse2}');

}
annotate PumoriProductService.packingHouse2CountryValueHelp with {
    packingHouse2Country @(title: '{i18n>packingHouse2Country}');

}
annotate PumoriProductService.packingTypeValueHelp with {
    packingType          @(title: '{i18n>packingType}');

}
annotate PumoriProductService.packageSizeValueHelp with {
    packageSize          @(title: '{i18n>packageSize}');

}
annotate PumoriProductService.testingHouse1ValueHelp with {
    testingHouse1        @(title: '{i18n>testingHouse1}');

}
annotate PumoriProductService.testingHouse1CountryValueHelp with {
    testingHouse1Country @(title: '{i18n>testingHouse1Country}');

}
annotate PumoriProductService.testingHouse2ValueHelp with {
    testingHouse2        @(title: '{i18n>testingHouse2}');

}
annotate PumoriProductService.testingHouse2CountryValueHelp with {
    testingHouse2Country @(title: '{i18n>testingHouse2Country}');

}
annotate PumoriProductService.lvormValueHelp with {
   lvorm                @(title: '{i18n>LVORM}');
}
annotate PumoriProductService.reqstratValueHelp with {
   reqstrat             @(title: '{i18n>reqStrat}');
}
annotate PumoriProductService.fxhorValueHelp with {
   fxhor                @(title: '{i18n>FXHOR}');
}
annotate PumoriProductService.plannerNameValueHelp with {
    plannerName          @(title: '{i18n>plnrNm}');
}
annotate PumoriProductService.shflgValueHelp with {
    shflg                @(title: '{i18n>SHFLG}');
}
annotate PumoriProductService.sobslValueHelp with {
    sobsl                @(title: '{i18n>SOBSL}');
}
annotate PumoriProductService.mmstaValueHelp with {
    mmsta                @(title: '{i18n>MMSTA}');
}
annotate PumoriProductService.dismmValueHelp with {
   dismm                @(title: '{i18n>DISMM}');
}
annotate PumoriProductService.dislsValueHelp with {
   disls                @(title: '{i18n>DISLS}');
}
annotate PumoriProductService.fhoriValueHelp with {
   fhori                @(title: '{i18n>FHORI}');
}
annotate PumoriProductService.ekgrpValueHelp with {
   ekgrp                @(title: '{i18n>EKGRP}');
}
annotate PumoriProductService.kzausValueHelp with {
   kzaus                @(title: '{i18n>KZAUS}');
}
annotate PumoriProductService.ausdtValueHelp with {
   ausdt                @(title: '{i18n>AUSDT}');
}
annotate PumoriProductService.atpkzValueHelp with {
   atpkz                @(title: '{i18n>ATPKZ}');
}
annotate PumoriProductService.prctrValueHelp with {
   prctr                @(title: '{i18n>PRCTR}');
}
annotate PumoriProductService.nfmatValueHelp with {
   nfmat                @(title: '{i18n>NFMAT}');
}

annotate PumoriProductService.PumoriLocationProductsView with @(UI: {
    SelectionFields: [
        prodId,
        locId
    ],
    LineItem       : [
        {
            Value: prodId,
            Label: '{i18n>genHPPN}'
        },
        {
            Value: locId,
            Label: '{i18n>locid}'
        },
        {
            Value: LOCTYPETEXT,
            Label: '{i18n>loctype}'
        },
        {
            Value: procurementType,
            Label: '{i18n>proctype}'
        },
        {
            Value: zcancelWindow,
            Label: '{i18n>cnWin}'
        },
        {
            Value: zmanuName,
            Label: '{i18n>manName}'
        },
        {
            Value: ztargetBuffer,
            Label: '{i18n>SztargetBuffer}'
        }

    ]
}) {

    prodId @(Common: {
        Text     : {
            $value                : prodId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>genhp}',
            CollectionPath : 'ProdIdProdLocationValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodId,
                ValueListProperty: 'prodId'
            }]
        }
    });

    locId  @(Common: {
        Text     : {
            $value                : locId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>locid}',
            CollectionPath : 'LocIdProdLocationValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locId,
                ValueListProperty: 'locId'
            }]
        }
    });
    zmpn  @(Common: {
        Text     : {
            $value                : zmpn,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zmpn,
            CollectionPath : 'zmpnValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmpn,
                ValueListProperty: 'zmpn'
            }]
        }
    });
    zmpaPartno  @(Common: {
        Text     : {
            $value                : zmpaPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zmpaPartno,
            CollectionPath : 'zmpaPartnoValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmpaPartno,
                ValueListProperty: 'zmpaPartno'
            }]
        }
    });
    procurementType  @(Common: {
        Text     : {
            $value                : procurementType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : procurementType,
            CollectionPath : 'procurementTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: procurementType,
                ValueListProperty: 'procurementType'
            }]
        }
    });
    zmanuName  @(Common: {
        Text     : {
            $value                : zmanuName,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zmanuName,
            CollectionPath : 'zmanuNameValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmanuName,
                ValueListProperty: 'zmanuName'
            }]
        }
    });
    zcancelWindow  @(Common: {
        Text     : {
            $value                : zcancelWindow,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zcancelWindow,
            CollectionPath : 'zcancelWindowValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zcancelWindow,
                ValueListProperty: 'zcancelWindow'
            }]
        }
    });
    soleSourceFlag  @(Common: {
        Text     : {
            $value                : soleSourceFlag,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : soleSourceFlag,
            CollectionPath : 'soleSourceFlagValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: soleSourceFlag,
                ValueListProperty: 'soleSourceFlag'
            }]
        }
    });
    outSource  @(Common: {
        Text     : {
            $value                : outSource,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : outSource,
            CollectionPath : 'outSourceValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: outSource,
                ValueListProperty: 'outSource'
            }]
        }
    });
    foundry1  @(Common: {
        Text     : {
            $value                : foundry1,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry1,
            CollectionPath : 'foundry1ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry1,
                ValueListProperty: 'foundry1'
            }]
        }
    });
    foundry1Site  @(Common: {
        Text     : {
            $value                : foundry1Site,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry1Site,
            CollectionPath : 'foundry1SiteValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry1Site,
                ValueListProperty: 'foundry1Site'
            }]
        }
    });
    foundry1Country  @(Common: {
        Text     : {
            $value                : foundry1Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry1Country,
            CollectionPath : 'foundry1CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry1Country,
                ValueListProperty: 'foundry1Country'
            }]
        }
    });
    foundry2  @(Common: {
        Text     : {
            $value                : foundry2,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry2,
            CollectionPath : 'foundry2ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry2,
                ValueListProperty: 'foundry2'
            }]
        }
    });
    foundry2Site  @(Common: {
        Text     : {
            $value                : foundry2Site,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry2Site,
            CollectionPath : 'foundry2SiteValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry2Site,
                ValueListProperty: 'foundry2Site'
            }]
        }
    });
    foundry2Country  @(Common: {
        Text     : {
            $value                : foundry2Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : foundry2Country,
            CollectionPath : 'foundry2CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: foundry2Country,
                ValueListProperty: 'foundry2Country'
            }]
        }
    });
    waferSize  @(Common: {
        Text     : {
            $value                : waferSize,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : waferSize,
            CollectionPath : 'waferSizeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: waferSize,
                ValueListProperty: 'waferSize'
            }]
        }
    });
    nodeProcess  @(Common: {
        Text     : {
            $value                : nodeProcess,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : nodeProcess,
            CollectionPath : 'nodeProcessValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: nodeProcess,
                ValueListProperty: 'nodeProcess'
            }]
        }
    });
    nodeProcessGroup  @(Common: {
        Text     : {
            $value                : nodeProcessGroup,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : nodeProcessGroup,
            CollectionPath : 'nodeProcessGroupValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: nodeProcessGroup,
                ValueListProperty: 'nodeProcessGroup'
            }]
        }
    });
    packingHouse1  @(Common: {
        Text     : {
            $value                : packingHouse1,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packingHouse1,
            CollectionPath : 'packingHouse1ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packingHouse1,
                ValueListProperty: 'packingHouse1'
            }]
        }
    });
    packingHouse1Country  @(Common: {
        Text     : {
            $value                : packingHouse1Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packingHouse1Country,
            CollectionPath : 'packingHouse1CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packingHouse1Country,
                ValueListProperty: 'packingHouse1Country'
            }]
        }
    });
     packingHouse2  @(Common: {
        Text     : {
            $value                : packingHouse2,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packingHouse2,
            CollectionPath : 'packingHouse2ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packingHouse2,
                ValueListProperty: 'packingHouse2'
            }]
        }
    });
     packingHouse2Country  @(Common: {
        Text     : {
            $value                : packingHouse2Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packingHouse2Country,
            CollectionPath : 'packingHouse2CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packingHouse2Country,
                ValueListProperty: 'packingHouse2Country'
            }]
        }
    });
     packingType  @(Common: {
        Text     : {
            $value                : packingType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packingType,
            CollectionPath : 'packingTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packingType,
                ValueListProperty: 'packingType'
            }]
        }
    });
    packageSize  @(Common: {
        Text     : {
            $value                : packageSize,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : packageSize,
            CollectionPath : 'packageSizeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: packageSize,
                ValueListProperty: 'packageSize'
            }]
        }
    });
    testingHouse1  @(Common: {
        Text     : {
            $value                : testingHouse1,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : testingHouse1,
            CollectionPath : 'testingHouse1ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: testingHouse1,
                ValueListProperty: 'testingHouse1'
            }]
        }
    });
    testingHouse1Country  @(Common: {
        Text     : {
            $value                : testingHouse1Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : testingHouse1Country,
            CollectionPath : 'testingHouse1CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: testingHouse1Country,
                ValueListProperty: 'testingHouse1Country'
            }]
        }
    });
    testingHouse2  @(Common: {
        Text     : {
            $value                : testingHouse2,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : testingHouse2,
            CollectionPath : 'testingHouse2ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: testingHouse2,
                ValueListProperty: 'testingHouse2'
            }]
        }
    });
    testingHouse2Country  @(Common: {
        Text     : {
            $value                : testingHouse2Country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : testingHouse2Country,
            CollectionPath : 'testingHouse2CountryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: testingHouse2Country,
                ValueListProperty: 'testingHouse2Country'
            }]
        }
    });
    lvorm  @(Common: {
        Text     : {
            $value                : lvorm,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : lvorm,
            CollectionPath : 'lvormValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: lvorm,
                ValueListProperty: 'lvorm'
            }]
        }
    });
    reqstrat  @(Common: {
        Text     : {
            $value                : reqstrat,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : reqstrat,
            CollectionPath : 'reqstratValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: reqstrat,
                ValueListProperty: 'reqstrat'
            }]
        }
    });
    fxhor  @(Common: {
        Text     : {
            $value                : fxhor,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : fxhor,
            CollectionPath : 'fxhorValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: fxhor,
                ValueListProperty: 'fxhor'
            }]
        }
    });
    plannerName  @(Common: {
        Text     : {
            $value                : plannerName,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : plannerName,
            CollectionPath : 'plannerNameValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: plannerName,
                ValueListProperty: 'plannerName'
            }]
        }
    });
    shflg  @(Common: {
        Text     : {
            $value                : shflg,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : shflg,
            CollectionPath : 'shflgValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: shflg,
                ValueListProperty: 'shflg'
            }]
        }
    });
    sobsl  @(Common: {
        Text     : {
            $value                : sobsl,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : sobsl,
            CollectionPath : 'sobslValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: sobsl,
                ValueListProperty: 'sobsl'
            }]
        }
    });
    mmsta  @(Common: {
        Text     : {
            $value                : mmsta,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : mmsta,
            CollectionPath : 'mmstaValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: mmsta,
                ValueListProperty: 'mmsta'
            }]
        }
    });
    dismm  @(Common: {
        Text     : {
            $value                : dismm,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : dismm,
            CollectionPath : 'dismmValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: dismm,
                ValueListProperty: 'dismm'
            }]
        }
    });
    disls  @(Common: {
        Text     : {
            $value                : disls,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : disls,
            CollectionPath : 'dislsValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: disls,
                ValueListProperty: 'disls'
            }]
        }
    });
    fhori  @(Common: {
        Text     : {
            $value                : fhori,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : fhori,
            CollectionPath : 'fhoriValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: fhori,
                ValueListProperty: 'fhori'
            }]
        }
    });
    ekgrp  @(Common: {
        Text     : {
            $value                : ekgrp,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : ekgrp,
            CollectionPath : 'ekgrpValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ekgrp,
                ValueListProperty: 'ekgrp'
            }]
        }
    });
    kzaus  @(Common: {
        Text     : {
            $value                : kzaus,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : kzaus,
            CollectionPath : 'kzausValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: kzaus,
                ValueListProperty: 'kzaus'
            }]
        }
    });
    ausdt  @(Common: {
        Text     : {
            $value                : ausdt,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : ausdt,
            CollectionPath : 'ausdtValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ausdt,
                ValueListProperty: 'ausdt'
            }]
        }
    });
    atpkz  @(Common: {
        Text     : {
            $value                : atpkz,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : atpkz,
            CollectionPath : 'atpkzValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: atpkz,
                ValueListProperty: 'atpkz'
            }]
        }
    });
    prctr  @(Common: {
        Text     : {
            $value                : prctr,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : prctr,
            CollectionPath : 'prctrValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prctr,
                ValueListProperty: 'prctr'
            }]
        }
    });
    nfmat  @(Common: {
        Text     : {
            $value                : nfmat,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : nfmat,
            CollectionPath : 'nfmatValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: nfmat,
                ValueListProperty: 'nfmat'
            }]
        }
    });
};

//product location annotation end

annotate PumoriProductService.PumoriTranslaneView with {
    prodId        @(title: '{i18n>PsgenHPPN}');
    locFr         @(title: '{i18n>fromLocId}');
    locfrType     @(title: '{i18n>fromLocTyp}');
    locTo         @(title: '{i18n>toLocId}');
    zmpaPartno    @(title: '{i18n>zmpaPartno}');
    loctoType     @(title: '{i18n>toLocTyp}');
    mot           @(title: '{i18n>mot}');
    leadTime      @(title: '{i18n>ldTime}');
    coO           @(title: '{i18n>coO}');
    lotSize       @(title: '{i18n>lotSize}');
    moq           @(title: '{i18n>moq}');
    pPriority     @(title: '{i18n>pPrty}');
    zQuota        @(title: '{i18n>qta}');
    spQ           @(title: '{i18n>spq}');
    sourcingModel @(title: '{i18n>sourcingModel}');
    validFrom     @(title: '{i18n>validFrom}');
    validTo       @(title: '{i18n>validTo}');
    LSMIN         @(title: '{i18n>LSMINA}');       
    BSTRF         @(title: '{i18n>BSTRF}');        
    BLOCKED       @(title: '{i18n>BLOCKED}');      
    EKORG         @(title: '{i18n>EKORG}');         
    LSMAX             @(title: '{i18n>LSMAX}');
    ESOKZ             @(title: '{i18n>Esokz}');
    BSTMA             @(title: '{i18n>BSTMA}');
    INFNR             @(title: '{i18n>Infnr}');
    SRC_LOC_TZ_X      @(title: '{i18n>srcloctzX}');
    TRANS_CALENDAR    @(title: '{i18n>transCalendar}');
    FLAG              @(title: '{i18n>FLAG}');
    ZERROR            @(title: '{i18n>ZERROR}');
    @UI.HiddenFilter FLAG;
    @UI.Hidden FLAG;
    @UI.HiddenFilter ZERROR;
    @UI.Hidden ZERROR;
    @UI.HiddenFilter LSMAX;
    @UI.Hidden LSMAX;
    @UI.HiddenFilter BSTRF;
    @UI.Hidden BSTRF;
    @UI.HiddenFilter markedforDeletion  @(title: '{i18n>markdel}');
    @UI.HiddenFilter custAttr1          @(title: '{i18n>custAttr1}');
    @UI.HiddenFilter custAttr2          @(title: '{i18n>custAttr2}');
    @UI.HiddenFilter custAttr3          @(title: '{i18n>custAttr3}');
    @UI.HiddenFilter custAttr4          @(title: '{i18n>custAttr4}');
    @UI.HiddenFilter custAttr5          @(title: '{i18n>custAttr5}');
    @UI.HiddenFilter custAttr6          @(title: '{i18n>custAttr6}');
    @UI.HiddenFilter custAttr7          @(title: '{i18n>custAttr7}');
    @UI.HiddenFilter custAttr8          @(title: '{i18n>custAttr8}');
    @UI.HiddenFilter custAttr9          @(title: '{i18n>custAttr9}');
    @UI.HiddenFilter custAttr10         @(title: '{i18n>custAttr10}');
    @UI.Hidden markedforDeletion;
    @UI.Hidden custAttr1;
    @UI.Hidden custAttr2;
    @UI.Hidden custAttr3;
    @UI.Hidden custAttr4;
    @UI.Hidden custAttr5;
    @UI.Hidden custAttr6;
    @UI.Hidden custAttr7;
    @UI.Hidden custAttr8;
    @UI.Hidden custAttr9;
    @UI.Hidden custAttr10;
}
annotate PumoriProductService.zmpaPartnotValueHelp with {
    zmpaPartno    @(title: '{i18n>zmpaPartno}');
}

annotate PumoriProductService.PumoriTranslaneView with @(
    UI          : {
        SelectionFields: [
            prodId,
            zmpaPartno,
            locFr,
            locTo,
            locfrType,
            loctoType,
            mot,
            validFrom,
            validTo
        ],
        LineItem       : [
            {
                Value: prodId,
                Label: '{i18n>PsgenHPPN}'
            },
            {
                Value: zmpaPartno,
                Label: '{i18n>zmpaPartno}'
            },
            {
                Value: locFr,
                Label: '{i18n>fromLocId}'
            },
            {
                Value: locfrType,
                Label: '{i18n>fromLocTyp}'
            },
            {
                Value: locTo,
                Label: '{i18n>toLocId}'
            },
            {
                Value: loctoType,
                Label: '{i18n>toLocTyp}'
            },
            {
                Value: pPriority,
                Label: '{i18n>pPrty}'
            },
            {
                Value: leadTime,
                Label: '{i18n>ldTime}'
            },
            {
                Value: zQuota,
                Label: '{i18n>qta}'
            },
            {
                Value: validFrom,
                Label: '{i18n>validFrom}'
            },
            {
                Value: validTo,
                Label: '{i18n>validTo}'
            },
        ]
    },
    Capabilities: {FilterRestrictions: {FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validFrom,
            AllowedExpressions: 'SingleRange'
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validTo,
            AllowedExpressions: 'SingleRange'
        }
    ]}}
) {

    prodId    @(Common: {
        Text     : {
            $value                : prodId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>genhp}',
            CollectionPath : 'PumoriProdTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodId,
                ValueListProperty: 'prodId'
            }]
        }
    });

    zmpaPartno    @(Common: {
        Text     : {
            $value                : zmpaPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zmpaPartno,
            CollectionPath : 'zmpaPartnoValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmpaPartno,
                ValueListProperty: 'zmpaPartno'
            }]
        }
    });

    locFr     @(Common: {
        Text     : {
            $value                : locFr,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>fromLocId}',
            CollectionPath : 'locFrTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locFr,
                ValueListProperty: 'locFr'
            }]
        }
    });

    locTo     @(Common: {
        Text     : {
            $value                : locTo,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>toLocId}',
            CollectionPath : 'locToTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locTo,
                ValueListProperty: 'locTo'
            }]
        }
    });

    locfrType @(Common: {
        Text     : {
            $value                : locfrType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>fromLocTyp}',
            CollectionPath : 'locFrTypeTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locfrType,
                ValueListProperty: 'locfrType'
            }]
        }
    });

    loctoType @(Common: {
        Text     : {
            $value                : loctoType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>toLocTyp}',
            CollectionPath : 'loctoTypeTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: loctoType,
                ValueListProperty: 'loctoType'
            }]
        }
    });

    mot       @(Common: {
        Text     : {
            $value                : mot,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>mot}',
            CollectionPath : 'motTlaneValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: mot,
                ValueListProperty: 'mot'
            }]
        }
    });
    validFrom;
    validTo;

};

//Tlane annotation end

annotate PumoriProductService.mappingFtFv with {
    factoryNumber @(title: '{i18n>facNum}');
    zhfvtypeFac   @(title: '{i18n>zhfvtypeFac}');
    zhfvvalueFac  @(title: '{i18n>zhfvvalueFac}');
    zhfvtypeHP    @(title: '{i18n>zhfvtypeHP}');
    zhfvvalueHP   @(title: '{i18n>zhfvvalueHP}');
    @UI.Hidden default;
    @UI.HiddenFilter default;
}

annotate PumoriProductService.factoryNumbermappingFtFvValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
}

annotate PumoriProductService.zhfvtypeFacMappingFtFvValueHelp with {
    zhfvtypeFac @(title: '{i18n>zhfvtypeFac}');
}

annotate PumoriProductService.zhfvvalueFacMappingFtFvValueHelp with {
    zhfvvalueFac @(title: '{i18n>zhfvvalueFac}');
}

annotate PumoriProductService.zhfvtypeHPMappingFtFvValueHelp with {
    zhfvtypeHP @(title: '{i18n>zhfvtypeHP}');
}

annotate PumoriProductService.zhfvvalueHPMappingFtFvValueHelp with {
    zhfvvalueHP @(title: '{i18n>zhfvvalueHP}');
}

annotate PumoriProductService.mappingFtFv with @(
    UI          : {
        SelectionFields: [factoryNumber],
        LineItem       : [
            {
                Value                : factoryNumber,
                Label                : factoryNumber,
                ![@HTML5.CssDefaults]: {width: '16rem'}
            },
            {
                Value                : zhfvtypeFac,
                Label                : zhfvtypeFac,
                ![@HTML5.CssDefaults]: {width: '16rem'}
            },
            {
                Value                : zhfvvalueFac,
                Label                : zhfvvalueFac,
                ![@HTML5.CssDefaults]: {width: '16rem'}
            },
            {
                Value                : zhfvtypeHP,
                Label                : zhfvtypeHP,
                ![@HTML5.CssDefaults]: {width: '16rem'}
            },
            {
                Value                : zhfvvalueHP,
                Label                : zhfvvalueHP,
                ![@HTML5.CssDefaults]: {width: '16rem'}
            }
        ],
    },
    Capabilities: {FilterRestrictions: {
        $Type             : 'Capabilities.FilterRestrictionsType',
        RequiredProperties: [factoryNumber]
    }, }
) {
    factoryNumber @(Common: {
        Text     : {
            $value                : factoryNumber,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : factoryNumber,
            CollectionPath : 'factoryNumbermappingFtFvValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryNumber,
                ValueListProperty: 'factoryNumber'
            }]
        }
    });
    zhfvtypeFac @(Common: {
        Text     : {
            $value                : zhfvtypeFac,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zhfvtypeFac,
            CollectionPath : 'zhfvtypeFacMappingFtFvValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvtypeFac,
                ValueListProperty: 'zhfvtypeFac'
            }]
        }
    });
    zhfvvalueFac @(Common: {
        Text     : {
            $value                : zhfvvalueFac,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zhfvvalueFac,
            CollectionPath : 'zhfvvalueFacMappingFtFvValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvvalueFac,
                ValueListProperty: 'zhfvvalueFac'
            }]
        }
    });
    zhfvtypeHP @(Common: {
        Text     : {
            $value                : zhfvtypeHP,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zhfvtypeHP,
            CollectionPath : 'zhfvtypeHPMappingFtFvValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvtypeHP,
                ValueListProperty: 'zhfvtypeHP'
            }]
        }
    });
    zhfvvalueHP @(Common: {
        Text     : {
            $value                : zhfvvalueHP,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zhfvvalueHP,
            CollectionPath : 'zhfvvalueHPMappingFtFvValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvvalueHP,
                ValueListProperty: 'zhfvvalueHP'
            }]
        }
    });
};


annotate PumoriProductService.manageflag with {
    zhfvType          @(title: '{i18n>featureType}');
    Strategicautoflag @(title: '{i18n>Stratgicatoflg}');
    @UI.HiddenFilter dsp;
    @UI.Hidden
    dsp @(title: '{i18n>dsp}');
    @UI.HiddenFilter response;
    response @(title: '{i18n>response}');
}

annotate PumoriProductService.viewmanageflagfthelp with {
    zhfvType @(title: '{i18n>featureType}');

}

annotate PumoriProductService.manageflag with @(UI: {
    SelectionFields: [zhfvType],
    LineItem       : [
        {
            Value: zhfvType,
            Label: '{i18n>featureType}'
        },
        {
            Value: Strategicautoflag,
            Label: '{i18n>Stratgicatoflg}'
        },
        {
            Value: response,
            Label: '{i18n>response}'
        }

    ]
}) {
    zhfvType @(Common: {
        Text     : {
            $value                : zhfvType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureType}',
            CollectionPath : 'viewmanageflagfthelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvType,
                ValueListProperty: 'zhfvType'
            }]
        }
    });
};

annotate PumoriProductService.FactoryProductsHistoryView with {
    factoryNumber     @(title: '{i18n>facNum}');
    prodId            @(title: '{i18n>zmpn}');
    prodDesc          @(title: '{i18n>prdDesc}');
    zmpaPartno        @(title: '{i18n>facPrtNum}');
    zHpPartno         @(title: '{i18n>hpPartNum}');
    snapshotDate      @(title: '{i18n>snapShotDate}');
    baseunitofMeasure @(title: '{i18n>buom}');
    materialTypeText  @(title: '{i18n>matType}');
    zbtpComp          @(title: '{i18n>pumoriPN}');
    zplcStatus        @(title: '{i18n>zplcStatus}');
    unspscCode        @(title: '{i18n>unpsc}');
    zhfvType          @(title: '{i18n>featureType}');
    zhfvValue         @(title: '{i18n>featureValue}');
    zintroDate        @(title: '{i18n>intrdate}');
    category          @(title: '{i18n>mtrCategory}');
    materialGroup     @(title: '{i18n>mtrGrp}');
    gatingAttribute   @(title: '{i18n>gtrAtrr}');
    markedforDeletion @(title: '{i18n>markdel}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
};

annotate PumoriProductService.MPNValueHistoryHelp with {
    prodId        @(title: '{i18n>zmpn}');
    factoryNumber @(title: '{i18n>facNum}');
    zmpaPartno    @(title: '{i18n>facPrtNum}');
    zHpPartno     @(title: '{i18n>hpPartNum}');
}

annotate PumoriProductService.prodIdHistoryValueHelp with {
    prodId @(title: '{i18n>zmpn}');
}

annotate PumoriProductService.FactoryNumberHistoryValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
}

annotate PumoriProductService.FactoryPartNumberHistoryValueHelp with {
    zmpaPartno @(title: '{i18n>facPrtNum}');
}

annotate PumoriProductService.HpPartNumberHistoryValueHelp with {
    zHpPartno @(title: '{i18n>hpPartNum}');
}

annotate PumoriProductService.materialTypeValueHelp with {
    materialTypeText @(title: '{i18n>matType}');
}

annotate PumoriProductService.FeatureTypeFillValueHelp with {
    zhfvType @(title: '{i18n>featureType}');
};

annotate PumoriProductService.FeatureValueFillValueHelp with {
    zhfvValue @(title: '{i18n>featureValue}');
};

// VALUE HELP ANNOTATIONS FOR FactoryProductsHistoryView

annotate PumoriProductService.zbtpCompValueHelp with {
    zbtpComp          @(title: '{i18n>pumoriPN}');
};

annotate PumoriProductService.prodDescValueHelp with {
    prodDesc          @(title: '{i18n>prdDesc}');
};

annotate PumoriProductService.baseunitofMeasureValueHelp with {
    baseunitofMeasure @(title: '{i18n>buom}');
};

annotate PumoriProductService.zplcStatusValueHelp with {
    zplcStatus        @(title: '{i18n>zplcStatus}');
};

annotate PumoriProductService.unspscCodeValueHelp with {
    unspscCode        @(title: '{i18n>unpsc}');
};

annotate PumoriProductService.materialGroupValueHelp with {
    materialGroup     @(title: '{i18n>mtrGrp}');
};

annotate PumoriProductService.gatingAttributeValueHelp with {
    gatingAttribute   @(title: '{i18n>gtrAtrr}');
};

annotate PumoriProductService.categoryValueHelp with {
    category          @(title: '{i18n>mtrCategory}');
};

// VALUE HELP ANNOTATIONS FOR FactoryProductsHistoryView END

annotate PumoriProductService.FactoryProductsHistoryView with @(
    UI          : {
        SelectionFields: [
            factoryNumber,
            prodId,
            zmpaPartno,
            zHpPartno,
            zhfvType,
            zhfvValue,
            materialTypeText
        ],
        LineItem       : [
            {
                Value: factoryNumber,
                Label: '{i18n>facNum}',
            },
            {
                Value: prodId,
                Label: '{i18n>zmpn}',
            },
            {
                Value: prodDesc,
                Label: '{i18n>prdDesc}'
            },
            {
                Value: zmpaPartno,
                Label: '{i18n>prtNum}'
            },
            {
                Value: zHpPartno,
                Label: '{i18n>hpPart}'
            },
            {
                Value: zbtpComp,
                Label: '{i18n>pumoriPN}'
            },
            {
                Value: zhfvType,
                Label: '{i18n>featureType}'
            },
            {
                Value: zhfvValue,
                Label: '{i18n>featureValue}'
            },
            {
                Value: materialTypeText,
                Label: '{i18n>matType}'
            },
            {
                Value: snapshotDate,
                Label: '{i18n>snapShotDate}'
            },
        ]
    },
    Capabilities: {FilterRestrictions: {
        $Type             : 'Capabilities.FilterRestrictionsType',
        RequiredProperties: [factoryNumber]
    }}
) {
    factoryNumber    @(Common: {
        Text     : {
            $value                : factoryNumber,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : factoryNumber,
            CollectionPath : 'FactoryNumberHistoryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryNumber,
                ValueListProperty: 'factoryNumber'
            }]
        }
    });
    prodId           @(Common: {
        Text     : {
            $value                : prodId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>zmpn}',
            CollectionPath : 'prodIdHistoryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodId,
                ValueListProperty: 'prodId'
            }]
        }
    });
    zhfvType         @(Common: {
        Text     : {
            $value                : zhfvType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureType}',
            CollectionPath : 'FeatureTypeFillValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvType,
                ValueListProperty: 'zhfvType'
            }]
        }
    });
    zhfvValue        @(Common: {
        Text     : {
            $value                : zhfvValue,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureValue}',
            CollectionPath : 'FeatureValueFillValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvValue,
                ValueListProperty: 'zhfvValue'
            }]
        }
    });
    zmpaPartno       @(Common: {
        Text     : {
            $value                : zmpaPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>facPrtNum}',
            CollectionPath : 'FactoryPartNumberHistoryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmpaPartno,
                ValueListProperty: 'zmpaPartno'
            }]
        }
    });
    zHpPartno        @(Common: {
        Text     : {
            $value                : zHpPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>hpPartNum}',
            CollectionPath : 'HpPartNumberHistoryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zHpPartno,
                ValueListProperty: 'zHpPartno'
            }]
        }
    });
    materialTypeText @(Common: {
        Text                    : {
            $value                : materialTypeText,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : '{i18n>matType}',
            CollectionPath : 'materialTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: materialTypeText,
                ValueListProperty: 'materialTypeText'
            }]
        },
        ValueListWithFixedValues: true
    });

    zbtpComp    @(Common: {
        Text     : {
            $value                : zbtpComp,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zbtpComp,
            CollectionPath : 'zbtpCompValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zbtpComp,
                ValueListProperty: 'zbtpComp'
            }]
        }
    });

    prodDesc    @(Common: {
        Text     : {
            $value                : prodDesc,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : prodDesc,
            CollectionPath : 'prodDescValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodDesc,
                ValueListProperty: 'prodDesc'
            }]
        }
    });

    baseunitofMeasure    @(Common: {
        Text     : {
            $value                : baseunitofMeasure,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : baseunitofMeasure,
            CollectionPath : 'baseunitofMeasureValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: baseunitofMeasure,
                ValueListProperty: 'baseunitofMeasure'
            }]
        }
    });

    zplcStatus    @(Common: {
        Text     : {
            $value                : zplcStatus,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zplcStatus,
            CollectionPath : 'zplcStatusValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zplcStatus,
                ValueListProperty: 'zplcStatus'
            }]
        }
    });

    unspscCode    @(Common: {
        Text     : {
            $value                : unspscCode,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : unspscCode,
            CollectionPath : 'unspscCodeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: unspscCode,
                ValueListProperty: 'unspscCode'
            }]
        }
    });

    materialGroup    @(Common: {
        Text     : {
            $value                : materialGroup,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : materialGroup,
            CollectionPath : 'materialGroupValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: materialGroup,
                ValueListProperty: 'materialGroup'
            }]
        }
    });

    gatingAttribute    @(Common: {
        Text     : {
            $value                : gatingAttribute,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : gatingAttribute,
            CollectionPath : 'gatingAttributeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: gatingAttribute,
                ValueListProperty: 'gatingAttribute'
            }]
        }
    });

    category    @(Common: {
        Text     : {
            $value                : category,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : category,
            CollectionPath : 'categoryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: category,
                ValueListProperty: 'category'
            }]
        }
    });
};

annotate PumoriProductService.UOMHistory with {
    factoryNumber @(title: '{i18n>facNum}');
    prodId        @(title: '{i18n>mpn}');
    uomAlt        @(title: '{i18n>facBaseUom}');
    denominator   @(title: '{i18n>den}');
    numerator     @(title: '{i18n>num}');
    snapshotDate  @(title: '{i18n>snapShotDate}');
};

annotate PumoriProductService.UOMHistory with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>genHPPN}'
    },
    {
        Value: uomAlt,
        Label: '{i18n>uomlt}'
    },
    {
        Value: numerator,
        Label: '{i18n>num}'
    },
    {
        Value: denominator,
        Label: '{i18n>den}'
    },
    {
        Value: snapshotDate,
        Label: '{i18n>snapShotDate}'
    }
], });

annotate PumoriProductService.LocationProductsHistory with {
    factoryNumber        @(title: '{i18n>facNum}');
    locId                @(title: '{i18n>locId}');
    prodId               @(title: '{i18n>mpn}');
    procurementType      @(title: '{i18n>prcType}');
    zmanuName            @(title: '{i18n>manNam}');
    ztargetBuffer        @(title: '{i18n>saftydDys}');
    grprocessingTime     @(title: '{i18n>grTime}');
    planneddeliveryTime  @(title: '{i18n>plndevtm}');
    snapshotDate         @(title: '{i18n>snapShotDate}');
    zinHouseLeadTime     @(title: '{i18n>zinHouseLeadTime}');
    soleSourceFlag       @(title: '{i18n>soleSourceFlag}');
    markedforDeletion    @(title: '{i18n>markdel}');
    em                   @(title: '{i18n>em}');
    outSource            @(title: '{i18n>outSource}');
    foundry1             @(title: '{i18n>foundry1}');
    foundry1Site         @(title: '{i18n>foundry1Site}');
    foundry1Country      @(title: '{i18n>foundry1Country}');
    foundry2             @(title: '{i18n>foundry2}');
    foundry2Site         @(title: '{i18n>foundry2Site}');
    foundry2Country      @(title: '{i18n>foundry2Country}');
    waferSize            @(title: '{i18n>waferSize}');
    nodeProcess          @(title: '{i18n>nodeProcess}');
    nodeProcessGroup     @(title: '{i18n>nodeProcessGroup}');
    packingHouse1        @(title: '{i18n>packingHouse1}');
    packingHouse1Country @(title: '{i18n>packingHouse1Country}');
    packingHouse2        @(title: '{i18n>packingHouse2}');
    packingHouse2Country @(title: '{i18n>packingHouse2Country}');
    packingType          @(title: '{i18n>packingType}');
    pin                  @(title: '{i18n>pin}');
    packageSize          @(title: '{i18n>packageSize}');
    testingHouse1        @(title: '{i18n>testingHouse1}');
    testingHouse1Country @(title: '{i18n>testingHouse1Country}');
    testingHouse2        @(title: '{i18n>testingHouse2}');
    testingHouse2Country @(title: '{i18n>testingHouse2Country}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.LocationProductsHistory with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>mpn}',
    },
    {
        Value: factoryNumber,
        Label: '{i18n>facNum}',
    },
    {
        Value: locId,
        Label: '{i18n>locId}'
    },
    {
        Value: procurementType,
        Label: '{i18n>prcType}'
    },
    {
        Value: zcancelWindow,
        Label: '{i18n>cnWin}'
    },
    {
        Value: zmanuName,
        Label: '{i18n>manNam}'
    },
    {
        Value: snapshotDate,
        Label: '{i18n>snapShotDate}'
    },
    {
        Value: grprocessingTime,
        Label: '{i18n>grTime}'
    },
], });

annotate PumoriProductService.TransLaneHistory with {
    factoryNumber     @(title: '{i18n>facNum}');
    prodId            @(title: '{i18n>mpn}');
    locFr             @(title: '{i18n>locFr}');
    locfrType         @(title: '{i18n>locfrType}');
    locTo             @(title: '{i18n>locTo}');
    loctoType         @(title: '{i18n>loctoType}');
    mot               @(title: '{i18n>mot}');
    leadTime          @(title: '{i18n>leadTime}');
    coO               @(title: '{i18n>coO}');
    lotSize           @(title: '{i18n>lotSize}');
    snapshotDate      @(title: '{i18n>snapShotDate}');
    moq               @(title: '{i18n>moq}');
    pPriority         @(title: '{i18n>pPriority}');
    zQuota            @(title: '{i18n>zQuota}');
    spQ               @(title: '{i18n>spQ}');
    sourcingModel     @(title: '{i18n>sourcingModel}');
    markedforDeletion @(title: '{i18n>markdel}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
};

annotate PumoriProductService.TransLaneHistory with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>mpn}'
    },
    {
        Value: locFr,
        Label: '{i18n>fromLocId}'
    },
    {
        Value: locfrType,
        Label: '{i18n>fromLocTyp}'
    },
    {
        Value: locTo,
        Label: '{i18n>toLocId}'
    },
    {
        Value: loctoType,
        Label: '{i18n>toLocTyp}'
    },
    {
        Value: leadTime,
        Label: '{i18n>ldTime}'
    },
    {
        Value: snapshotDate,
        Label: '{i18n>snapShotDate}'
    },
    {
        Value: zQuota,
        Label: '{i18n>qta}'
    },
], });

annotate PumoriProductService.FactoryLocationsHistory with {
    factoryNumber        @(title: '{i18n>facNum}');
    locId                @(title: '{i18n>locId}');
    locDescr             @(title: '{i18n>locDesc}');
    locType              @(title: '{i18n>locType}');
    zplantType           @(title: '{i18n>zplntType}');
    locRegion            @(title: '{i18n>locRgn}');
    locationAddress1     @(title: '{i18n>locAddr1}');
    locationAddress2     @(title: '{i18n>locAddr2}');
    city                 @(title: '{i18n>city}');
    state                @(title: '{i18n>stat}');
    country              @(title: '{i18n>cntry}');
    countryCode          @(title: '{i18n>cntryCode}');
    zipcode              @(title: '{i18n>zpcd}');
    snapshotDate         @(title: '{i18n>snapShotDate}');
    locationContact1Name @(title: '{i18n>locCon1}');
    locationEmail1       @(title: '{i18n>locEmail1}');
    locationContact2Name @(title: '{i18n>locCon2}');
    locationEmail2       @(title: '{i18n>locEmail2}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.synFactoryProductsView with {
    factoryNumber     @(title: '{i18n>facNum}');
    prodId            @(title: '{i18n>zmpn}');
    prodDesc          @(title: '{i18n>prdDesc}');
    zbtpComp          @(title: '{i18n>pumoriPN}');
    materialTypeText  @(title: '{i18n>matType}');
    zmpaPartno        @(title: '{i18n>facPrtNum}');
    zHpPartno         @(title: '{i18n>hpPartNum}');
    baseunitofMeasure @(title: '{i18n>buom}');
    zplcStatus        @(title: '{i18n>zplcStatus}');
    unspscCode        @(title: '{i18n>unpsc}');
    zhfvType          @(title: '{i18n>featureType}');
    zhfvValue         @(title: '{i18n>featureValue}');
    zintroDate        @(title: '{i18n>intrdate}');
    category          @(title: '{i18n>mtrCategory}');
    materialGroup     @(title: '{i18n>mtrGrp}');
    gatingAttribute   @(title: '{i18n>gtrAtrr}');
    markedforDeletion @(title: '{i18n>markdel}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.MPNValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
    prodId        @(title: '{i18n>zmpn}');
    zmpaPartno    @(title: '{i18n>facPrtNum}');
    zHpPartno     @(title: '{i18n>hpPartNum}');
}

annotate PumoriProductService.synprodIdValueHelp with {
    prodId @(title: '{i18n>zmpn}');
}

annotate PumoriProductService.synFactoryNumberValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
}

annotate PumoriProductService.FactoryPartNumberValueHelp with {
    zmpaPartno @(title: '{i18n>facPrtNum}');
}

annotate PumoriProductService.synFactoryProductsView with @(
    UI          : {
        SelectionFields: [
            factoryNumber,
            prodId,
            zmpaPartno,
            zHpPartno,
            materialTypeText,
            zhfvType,
            zhfvValue
        ],
        LineItem       : [
            {
                Value: factoryNumber,
                Label: '{i18n>facNum}',
            },
            {
                Value: prodId,
                Label: '{i18n>zmpn}',
            },
            {
                Value: zmpaPartno,
                Label: '{i18n>facPrtNum}'
            },
            {
                Value: zHpPartno,
                Label: '{i18n>hpPartNum}'
            },
            {
                Value: prodDesc,
                Label: '{i18n>prdDesc}'
            },
            {
                Value: zbtpComp,
                Label: '{i18n>pumoriPN}'
            },
            {
                Value: materialTypeText,
                Label: '{i18n>matType}'
            },
            {
                Value: baseunitofMeasure,
                Label: '{i18n>buom}'
            },
            {
                Value: zhfvType,
                Label: '{i18n>featureType}'
            },
            {
                Value: zhfvValue,
                Label: '{i18n>featureValue}'
            }
        ],
    },
    Capabilities: {FilterRestrictions: {
        $Type             : 'Capabilities.FilterRestrictionsType',
        RequiredProperties: [factoryNumber]
    }}
) {
    factoryNumber    @(Common: {
        Text     : {
            $value                : factoryNumber,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : factoryNumber,
            CollectionPath : 'synFactoryNumberValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryNumber,
                ValueListProperty: 'factoryNumber'
            }]
        }
    });
    prodId           @(Common: {
        Text     : {
            $value                : prodId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>zmpn}',
            CollectionPath : 'synprodIdValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prodId,
                ValueListProperty: 'prodId'
            }]
        }
    });
    zhfvType         @(Common: {
        Text     : {
            $value                : zhfvType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureType}',
            CollectionPath : 'FTTexthelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvType,
                ValueListProperty: 'zhfvType'
            }]
        }
    });
    zhfvValue        @(Common: {
        Text     : {
            $value                : zhfvValue,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>featureValue}',
            CollectionPath : 'FVTexthelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zhfvValue,
                ValueListProperty: 'zhfvValue'
            }]
        }
    });
    zmpaPartno       @(Common: {
        Text     : {
            $value                : zmpaPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>facPrtNum}',
            CollectionPath : 'FactoryPartNumberValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zmpaPartno,
                ValueListProperty: 'zmpaPartno'
            }]
        }
    });
    zHpPartno        @(Common: {
        Text     : {
            $value                : zHpPartno,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>hpPartNum}',
            CollectionPath : 'HpPartNumberValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zHpPartno,
                ValueListProperty: 'zHpPartno'
            }]
        }
    });
    materialTypeText @(Common: {
        Text                    : {
            $value                : materialTypeText,
            ![@UI.TextArrangement]: #TextOnly

        },
        ValueList               : {
            SearchSupported: true,
            Label          : '{i18n>matType}',
            CollectionPath : 'materialTypeTexthelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: materialTypeText,
                ValueListProperty: 'materialTypeText'
            }]
        },
        ValueListWithFixedValues: true
    });
};

annotate PumoriProductService.synUOMConversionView with {
    factoryNumber @(title: '{i18n>facNum}');
    prodId        @(title: '{i18n>mpn}');
    uomAlt        @(title: '{i18n>uomlt}');
    denominator   @(title: '{i18n>den}');
    numerator     @(title: '{i18n>num}');
}

annotate PumoriProductService.synUOMConversionView with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>mpn}'
    },
    {
        Value: uomAlt,
        Label: '{i18n>uomlt}'
    },
    {
        Value: numerator,
        Label: '{i18n>num}'
    },
    {
        Value: denominator,
        Label: '{i18n>den}'
    }
]});

annotate PumoriProductService.synLocationProductsView with {
    prodId               @(title: '{i18n>mpn}');
    factoryNumber        @(title: '{i18n>facNum}');
    locId                @(title: '{i18n>locid}');
    // location type missing
    procurementType      @(title: '{i18n>prcType}');
    zcancelWindow        @(title: '{i18n>cnWin}');
    zmanuName            @(title: '{i18n>manNam}');
    grprocessingTime     @(title: '{i18n>grTime}');
    ztargetBuffer        @(title: '{i18n>ztargetBuffer}');
    planneddeliveryTime  @(title: '{i18n>plndevtm}');
    zinHouseLeadTime     @(title: '{i18n>zinHouseLeadTime}');
    soleSourceFlag       @(title: '{i18n>soleSourceFlag}');
    markedforDeletion    @(title: '{i18n>markdel}');
    em                   @(title: '{i18n>em}');
    outSource            @(title: '{i18n>outSource}');
    foundry1             @(title: '{i18n>foundry1}');
    foundry1Site         @(title: '{i18n>foundry1Site}');
    foundry1Country      @(title: '{i18n>foundry1Country}');
    foundry2             @(title: '{i18n>foundry2}');
    foundry2Site         @(title: '{i18n>foundry2Site}');
    foundry2Country      @(title: '{i18n>foundry2Country}');
    waferSize            @(title: '{i18n>waferSize}');
    nodeProcess          @(title: '{i18n>nodeProcess}');
    nodeProcessGroup     @(title: '{i18n>nodeProcessGroup}');
    packingHouse1        @(title: '{i18n>packingHouse1}');
    packingHouse1Country @(title: '{i18n>packingHouse1Country}');
    packingHouse2        @(title: '{i18n>packingHouse2}');
    packingHouse2Country @(title: '{i18n>packingHouse2Country}');
    packingType          @(title: '{i18n>packingType}');
    pin                  @(title: '{i18n>pin}');
    packageSize          @(title: '{i18n>packageSize}');
    testingHouse1        @(title: '{i18n>testingHouse1}');
    testingHouse1Country @(title: '{i18n>testingHouse1Country}');
    testingHouse2        @(title: '{i18n>testingHouse2}');
    testingHouse2Country @(title: '{i18n>testingHouse2Country}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
};

annotate PumoriProductService.synLocationProductsView with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>mpn}',
    },
    {
        Value: factoryNumber,
        Label: '{i18n>facNum}',
    },
    {
        Value: locId,
        Label: '{i18n>locid}'
    },
    {
        Value: procurementType,
        Label: '{i18n>prcType}'
    },
    {
        Value: zcancelWindow,
        Label: '{i18n>cnWin}'
    },
    {
        Value: zmanuName,
        Label: '{i18n>manNam}'
    },
    {
        Value: grprocessingTime,
        Label: '{i18n>grTime}'
    },
]});

annotate PumoriProductService.synTranslaneView with {
    prodId            @(title: '{i18n>PsgenHPPN}');
    factoryNumber     @(title: '{i18n>facNum}');
    locFr             @(title: '{i18n>fromLocId}');
    locfrType         @(title: '{i18n>fromLocTyp}');
    locTo             @(title: '{i18n>toLocId}');
    loctoType         @(title: '{i18n>toLocTyp}');
    leadTime          @(title: '{i18n>ldTime}');
    zQuota            @(title: '{i18n>qta}');
    // HPPN value is missing
    mot               @(title: '{i18n>mot}');
    coO               @(title: '{i18n>coO}');
    lotSize           @(title: '{i18n>lotSize}');
    moq               @(title: '{i18n>moq}');
    pPriority         @(title: '{i18n>pPriority}');
    spQ               @(title: '{i18n>spQ}');
    sourcingModel     @(title: '{i18n>sourcingModel}');
    validFrom         @(title: '{i18n>validFrom}');
    validTo           @(title: '{i18n>validTo}');
    markedforDeletion @(title: '{i18n>markdel}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.synTranslaneView with @(UI: {LineItem: [
    {
        Value: prodId,
        Label: '{i18n>mpn}'
    },
    {
        Value: locFr,
        Label: '{i18n>fromLocId}'
    },
    {
        Value: locfrType,
        Label: '{i18n>fromLocTyp}'
    },
    {
        Value: locTo,
        Label: '{i18n>toLocId}'
    },
    {
        Value: loctoType,
        Label: '{i18n>toLocTyp}'
    },
    {
        Value: leadTime,
        Label: '{i18n>ldTime}'
    },
    {
        Value: zQuota,
        Label: '{i18n>qta}'
    },
    {
        Value: validFrom,
        Label: '{i18n>validFrom}'
    },
    {
        Value: validTo,
        Label: '{i18n>validTo}'
    },
], });

annotate PumoriProductService.synFactoryNoLocValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
}



annotate PumoriProductService.synFactoryLocationView with @(
    UI          : {
        SelectionFields: [factoryNumber],
        LineItem       : [
            {
                Value: factoryNumber,
                Label: '{i18n>facNum}',
            },
            {
                Value: locId,
                Label: '{i18n>locid}'
            },
            {
                Value: locDescr,
                Label: '{i18n>locDesc}'
            },
            {
                Value: locTypeText,
                Label: '{i18n>loctype}'
            },
            {
                Value: country,
                Label: '{i18n>cntry}'
            },
            {
                Value: zplantType,
                Label: '{i18n>zplntType}'
            }
        ],
    },
    Capabilities: {FilterRestrictions: {
        $Type             : 'Capabilities.FilterRestrictionsType',
        RequiredProperties: [factoryNumber]
    }}
) {
    factoryNumber @(Common: {
        Text     : {
            $value                : factoryNumber,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : factoryNumber,
            CollectionPath : 'synFactoryNoLocValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryNumber,
                ValueListProperty: 'factoryNumber'
            }]
        }
    });
};

annotate PumoriProductService.synFactoryLocationView with {
    factoryNumber        @(title: '{i18n>facNum}');
    locId                @(title: '{i18n>locid}');
    locDescr             @(title: '{i18n>locDesc}');
    locType              @(title: '{i18n>loctype}');
    @UI.HiddenFilter locTypeText  @(title: '{i18n>loctext}');
    zplantType           @(title: '{i18n>zplntType}');
    locRegion            @(title: '{i18n>locRgn}');
    locationAddress1     @(title: '{i18n>locAddr1}');
    locationAddress2     @(title: '{i18n>locAddr2}');
    city                 @(title: '{i18n>city}');
    state                @(title: '{i18n>stat}');
    country              @(title: '{i18n>cntry}');
    countryCode          @(title: '{i18n>cntryCode}');
    zipcode              @(title: '{i18n>zpcd}');
    locationContact1Name @(title: '{i18n>locCon1}');
    locationEmail1       @(title: '{i18n>locEmail1}');
    locationContact2Name @(title: '{i18n>locCon2}');
    locationEmail2       @(title: '{i18n>locEmail2}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate PumoriProductService.FactoryLocationsHistoryView with @(
    UI          : {
        SelectionFields: [factoryNumber],
        LineItem       : [
            {
                Value: factoryNumber,
                Label: '{i18n>facNum}',
            },
            {
                Value: locId,
                Label: '{i18n>locid}'
            },
            {
                Value: locDescr,
                Label: '{i18n>locDesc}'
            },
            {
                Value: locTypeText,
                Label: '{i18n>loctype}'
            },
            {
                Value: country,
                Label: '{i18n>cntry}'
            },
            {
                Value: snapshotDate,
                Label: '{i18n>snapShotDate}'
            },
            {
                Value: zplantType,
                Label: '{i18n>zplntType}'
            }
        ],
    },
    Capabilities: {FilterRestrictions: {
        $Type             : 'Capabilities.FilterRestrictionsType',
        RequiredProperties: [factoryNumber]
    }}
) {
    factoryNumber @(Common: {
        Text     : {
            $value                : factoryNumber,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : factoryNumber,
            CollectionPath : 'FactoryNoHistoryLocValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryNumber,
                ValueListProperty: 'factoryNumber'
            }]
        }
    });

    locId @(Common: {
        Text     : {
            $value                : locId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locId,
            CollectionPath : 'locIdValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locId,
                ValueListProperty: 'locId'
            }]
        }
    });

    locDescr @(Common: {
        Text     : {
            $value                : locDescr,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locDescr,
            CollectionPath : 'locDescrValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locDescr,
                ValueListProperty: 'locDescr'
            }]
        }
    });

    locType @(Common: {
        Text     : {
            $value                : locType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locType,
            CollectionPath : 'locTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locType,
                ValueListProperty: 'locType'
            }]
        }
    });

    zplantType @(Common: {
        Text     : {
            $value                : zplantType,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zplantType,
            CollectionPath : 'zplantTypeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zplantType,
                ValueListProperty: 'zplantType'
            }]
        }
    });

    locRegion @(Common: {
        Text     : {
            $value                : locRegion,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locRegion,
            CollectionPath : 'locRegionValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locRegion,
                ValueListProperty: 'locRegion'
            }]
        }
    });

    locationAddress1 @(Common: {
        Text     : {
            $value                : locationAddress1,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationAddress1,
            CollectionPath : 'locationAddress1ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationAddress1,
                ValueListProperty: 'locationAddress1'
            }]
        }
    });

    locationAddress2 @(Common: {
        Text     : {
            $value                : locationAddress2,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationAddress2,
            CollectionPath : 'locationAddress2ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationAddress2,
                ValueListProperty: 'locationAddress2'
            }]
        }
    });

    city @(Common: {
        Text     : {
            $value                : city,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : city,
            CollectionPath : 'cityValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: city,
                ValueListProperty: 'city'
            }]
        }
    });

    state @(Common: {
        Text     : {
            $value                : state,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : state,
            CollectionPath : 'stateValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: state,
                ValueListProperty: 'state'
            }]
        }
    });

    country @(Common: {
        Text     : {
            $value                : country,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : country,
            CollectionPath : 'countryValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: country,
                ValueListProperty: 'country'
            }]
        }
    });

    countryCode @(Common: {
        Text     : {
            $value                : countryCode,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : countryCode,
            CollectionPath : 'countryCodeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: countryCode,
                ValueListProperty: 'countryCode'
            }]
        }
    });

    zipcode @(Common: {
        Text     : {
            $value                : zipcode,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : zipcode,
            CollectionPath : 'zipcodeValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: zipcode,
                ValueListProperty: 'zipcode'
            }]
        }
    });

    locationContact1Name @(Common: {
        Text     : {
            $value                : locationContact1Name,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationContact1Name,
            CollectionPath : 'locationContact1NameValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationContact1Name,
                ValueListProperty: 'locationContact1Name'
            }]
        }
    });

    locationEmail1 @(Common: {
        Text     : {
            $value                : locationEmail1,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationEmail1,
            CollectionPath : 'locationEmail1ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationEmail1,
                ValueListProperty: 'locationEmail1'
            }]
        }
    });

    locationContact2Name @(Common: {
        Text     : {
            $value                : locationContact2Name,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationContact2Name,
            CollectionPath : 'locationContact2NameValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationContact2Name,
                ValueListProperty: 'locationContact2Name'
            }]
        }
    });

    locationEmail2 @(Common: {
        Text     : {
            $value                : locationEmail2,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : locationEmail2,
            CollectionPath : 'locationEmail2ValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: locationEmail2,
                ValueListProperty: 'locationEmail2'
            }]
        }
    });
};

annotate PumoriProductService.FactoryLocationsHistoryView with {
    factoryNumber        @(title: '{i18n>facNum}');
    locId                @(title: '{i18n>locid}');
    locDescr             @(title: '{i18n>locDesc}');
    locType              @(title: '{i18n>loctype}');
    @UI.HiddenFilter locTypeText  @(title: '{i18n>loctext}');
    zplantType           @(title: '{i18n>zplntType}');
    locRegion            @(title: '{i18n>locRgn}');
    locationAddress1     @(title: '{i18n>locAddr1}');
    locationAddress2     @(title: '{i18n>locAddr2}');
    city                 @(title: '{i18n>city}');
    state                @(title: '{i18n>stat}');
    country              @(title: '{i18n>cntry}');
    countryCode          @(title: '{i18n>cntryCode}');
    zipcode              @(title: '{i18n>zpcd}');
    locationContact1Name @(title: '{i18n>locCon1}');
    locationEmail1       @(title: '{i18n>locEmail1}');
    locationContact2Name @(title: '{i18n>locCon2}');
    locationEmail2       @(title: '{i18n>locEmail2}');
    @UI.HiddenFilter markedforDeletion;
    snapshotDate         @(title: '{i18n>snapShotDate}');
    @UI.Hidden markedforDeletion;
}


// VALUE HELP ANNOTATION FOR FactoryLocationsHistoryView

annotate PumoriProductService.FactoryNoHistoryLocValueHelp with {
    factoryNumber @(title: '{i18n>facNum}');
}

annotate PumoriProductService.locIdValueHelp with {
    locId                @(title: '{i18n>locid}');
}

annotate PumoriProductService.locDescrValueHelp with {
    locDescr             @(title: '{i18n>locDesc}');
}

annotate PumoriProductService.locTypeValueHelp with {
    locType              @(title: '{i18n>loctype}');
}

annotate PumoriProductService.zplantTypeValueHelp with {
    zplantType           @(title: '{i18n>zplntType}');
}

annotate PumoriProductService.locRegionValueHelp with {
    locRegion            @(title: '{i18n>locRgn}');
}

annotate PumoriProductService.locationAddress1ValueHelp with {
    locationAddress1     @(title: '{i18n>locAddr1}');
}

annotate PumoriProductService.locationAddress2ValueHelp with {
    locationAddress2     @(title: '{i18n>locAddr2}');
}

annotate PumoriProductService.cityValueHelp with {
    city                 @(title: '{i18n>city}');
}

annotate PumoriProductService.stateValueHelp with {
    state                @(title: '{i18n>stat}');
}

annotate PumoriProductService.countryValueHelp with {
    country              @(title: '{i18n>cntry}');
}

annotate PumoriProductService.countryCodeValueHelp with {
    countryCode          @(title: '{i18n>cntryCode}');
}

annotate PumoriProductService.zipcodeValueHelp with {
    zipcode              @(title: '{i18n>zpcd}');
}

annotate PumoriProductService.locationContact1NameValueHelp with {
    locationContact1Name @(title: '{i18n>locCon1}');
}

annotate PumoriProductService.locationEmail1ValueHelp with {
    locationEmail1       @(title: '{i18n>locEmail1}');
}

annotate PumoriProductService.locationContact2NameValueHelp with {
    locationContact2Name @(title: '{i18n>locCon2}');
}

annotate PumoriProductService.locationEmail2ValueHelp with {
    locationEmail2       @(title: '{i18n>locEmail2}');
}


//END OF VALUE HELP ANNOTATION FOR FactoryLocationsHistoryView