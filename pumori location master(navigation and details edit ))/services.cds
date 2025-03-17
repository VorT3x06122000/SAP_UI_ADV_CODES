
using from './pspumorilocui/annotations';

annotate PumoriLocationService.PumoriLocationsView with {
    locId                           @(title : '{i18n>locId}');
    locDescr                        @(title : '{i18n>locDescr}');
    locType                         @(title : '{i18n>locType}');
    country                         @(title : '{i18n>country}');
    countryCode                     @(title : '{i18n>countryCode}');
    plantType                       @(title : '{i18n>plantType}');
    zplantType                      @(title : '{i18n>zPlaType}');
    locRegion                       @(title : '{i18n>locRegion}');
    locationAddress1                @(title : '{i18n>locAd1}');
    locationAddress2                @(title : '{i18n>locAd2}');
    city                            @(title : '{i18n>city}');
    state                           @(title : '{i18n>state}');
    zipcode                         @(title : '{i18n>zipcode}');
    locationContact1Name            @(title : '{i18n>locCNa1}');
    locationEmail1                  @(title : '{i18n>locEm1}');
    locationContact2Name            @(title : '{i18n>locCNa2}');
    locationEmail2                  @(title : '{i18n>locEm2}');
    locationContact3Name            @(title : '{i18n>locCNa3}');
    locationContact4Name            @(title : '{i18n>locCNa4}');
    STRAS                           @(title : '{i18n>strtHno}');
    TIME_ZONE                       @(title : '{i18n>TZone}');
    TELF1                           @(title : '{i18n>telf}');
    PLIFZ                           @(title : '{i18n>plifz}');
    vendorGroup                     @(title : '{i18n>vendrGrp}');
    FABKL                           @(title : '{i18n>facCal}');
    LIFNR                           @(title : '{i18n>lifnr}');
    KUNNR                           @(title : '{i18n>kunnr}');
    ACTIVE_FLAG                     @(title : '{i18n>actveFlg}');
    PSTLZ                           @(title : '{i18n>pstLz}');
    PSTL2                           @(title : '{i18n>pstl2}');
    BUSINESS_UNIT                   @(title : '{i18n>bussUnit}');
    KUKLA                           @(title : '{i18n>kukla}');
    longitude                       @(title : '{i18n>longitude}');
    latitude                        @(title : '{i18n>latitude}');
    DUMMY_TS_LOC                    @(title : '{i18n>dummyTSLoc}');
    ETA_ETD                         @(title : '{i18n>etaETD}');
    WERKS                           @(title : '{i18n>werks}');
    Dabnode_Flag                    @(title : '{i18n>dabnode}');
    PA_Name                         @(title : '{i18n>paName}');
    Keeperflag                      @(title : '{i18n>kepFlg}');
    mainPlant                       @(title : '{i18n>consolidID}');
    opsiId                          @(title : '{i18n>opsiid}');
    marked                          @(title : '{i18n>marked}');
    @UI.HiddenFilter markedforDeletion;
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
    @UI.HiddenFilter marked;
    @UI.HiddenFilter locTypeText    @(title : '{i18n>locType}');
    @UI.HiddenFilter plantTypeText  @(title : '{i18n>plantType}');
    @UI.Hidden markedforDeletion;
};

annotate PumoriLocationService.LocIdValueHelp with {
    locId @(title : '{i18n>locId}');
}

annotate PumoriLocationService.VendorGrpValueHelp with {
    vendorGroup @(title : '{i18n>vendrGrp}');
}

annotate PumoriLocationService.VendorGrpNmeValueHelp with {
    locDescr @(title : '{i18n>locDescr}');
}

annotate PumoriLocationService.countryValueHelp with {
    country @(title : '{i18n>country}');
}
annotate PumoriLocationService.countryCodeValueHelp with {
    countryCode @(title : '{i18n>countryCode}');
}
annotate PumoriLocationService.plantTypeValueHelp with {
    plantType @(title : '{i18n>plantType}');
}
annotate PumoriLocationService.zplantTypeValueHelp with {
    zplantType @(title : '{i18n>zPlaType}');
}
annotate PumoriLocationService.locRegionValueHelp with {
    locRegion @(title : '{i18n>locRegion}');
}
annotate PumoriLocationService.locationAddress1ValueHelp with {
    locationAddress1 @(title : '{i18n>locAd1}');
}
annotate PumoriLocationService.locationAddress2ValueHelp with {
    locationAddress2 @(title : '{i18n>locAd2}');
}
annotate PumoriLocationService.cityValueHelp with {
    city @(title : '{i18n>city}');
}
annotate PumoriLocationService.stateValueHelp with {
    state @(title : '{i18n>state}');
}
annotate PumoriLocationService.zipcodeValueHelp with {
    zipcode @(title : '{i18n>zipcode}');
}
annotate PumoriLocationService.locationContact1NameValueHelp with {
    locationContact1Name @(title : '{i18n>locCNa1}');
}
annotate PumoriLocationService.locationEmail1ValueHelp with {
    locationEmail1 @(title : '{i18n>locEm1}');
}
annotate PumoriLocationService.locationContact2NameValueHelp with {
    locationContact2Name @(title : '{i18n>locCNa2}');
}
annotate PumoriLocationService.locationEmail2ValueHelp with {
    locationEmail2 @(title : '{i18n>locEm2}');
}
annotate PumoriLocationService.locationContact3NameValueHelp with {
    locationContact3Name @(title : '{i18n>locCNa3}');
}
annotate PumoriLocationService.locationContact4NameValueHelp with {
    locationContact4Name @(title : '{i18n>locCNa4}');
}
annotate PumoriLocationService.StreetHouseNumberValueHelp with {
    STRAS @(title : '{i18n>strtHno}');
}
annotate PumoriLocationService.AddressTimeZoneValueHelp with {
    TIME_ZONE @(title : '{i18n>TZone}');
}
annotate PumoriLocationService.FirstTelephoneNumberValueHelp with {
    TELF1 @(title : '{i18n>telf}');
}
annotate PumoriLocationService.FactoryCalendarValueHelp with {
    FABKL @(title : '{i18n>facCal}');
}
annotate PumoriLocationService.VendorCreditAccountNumberValueHelp with {
    LIFNR @(title : '{i18n>lifnr}');
}
annotate PumoriLocationService.CustomerNumberValueHelp with {
    KUNNR @(title : '{i18n>kunnr}');
}
annotate PumoriLocationService.PostalCodeValueHelp with {
    PSTLZ @(title : '{i18n>pstLz}');
}
annotate PumoriLocationService.POBoxPostalCodeValueHelp  with {
    PSTL2 @(title : '{i18n>pstl2}');
}

annotate PumoriLocationService.BusinessUnitValueHelp with {
    BUSINESS_UNIT @(title : '{i18n>bussUnit}');
}
annotate PumoriLocationService.CustomerClassificationValueHelp with {
    KUKLA @(title : '{i18n>kukla}');
}
annotate PumoriLocationService.DummyforIntegrationValueHelp with {
    DUMMY_TS_LOC @(title : '{i18n>dummyTSLoc}');
}
annotate PumoriLocationService.ETAETDValueHelp with {
    ETA_ETD @(title : '{i18n>etaETD}');
}
annotate PumoriLocationService.PlantValueHelp with {
    WERKS  @(title : '{i18n>werks}');
}
annotate PumoriLocationService.PlanningAreaValueHelp with {
    PA_Name  @(title : '{i18n>paName}');
}


annotate PumoriLocationService.PumoriLocationsView with @(UI : {
    SelectionFields : [
        locId,
        locDescr,
        vendorGroup,
        locType,
    ],
    LineItem        : [
        {
            Value : locId,
            Label : '{i18n>locId}'
        },
        {
            Value : locDescr,
            Label : '{i18n>locDescr}'

        },
        {
            Value : vendorGroup,
            Label : '{i18n>vendrGrp}'
        },
        {
            Value : locTypeText,
            Label : '{i18n>locType}'
        },
        {
            Value : Keeperflag,
            Label : '{i18n>kepFlg}'
        },
        {
            Value : mainPlant,
            Label : '{i18n>consolidID}'   
        }
        
    ]
});


annotate PumoriLocationService.PumoriLocationsView with {

    locId         @(Common : {
        Text      : {
            $value                 : locId,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locId,
            CollectionPath  : 'LocIdValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locId,
                ValueListProperty : 'locId'
            }

            ]
        }
    });
    locType       @(Common : {
        Text      : {
            $value                 : locType,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locType,
            CollectionPath  : 'PumoriLocations',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locType,
                ValueListProperty : 'locType'
            }

            ]
        }
    });
    vendorGroup      @(Common : {
        Text      : {
            $value                 : vendorGroup,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : vendorGroup,
            CollectionPath  : 'VendorGrpValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : vendorGroup,
                ValueListProperty : 'vendorGroup'
            }

            ]
        }
    });
    locDescr @(Common : {
        Text      : {
            $value                 : locDescr,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locDescr,
            CollectionPath  : 'VendorGrpNmeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locDescr,
                ValueListProperty : 'locDescr'
            }

            ]
        }
    });
    country @(Common : {
        Text      : {
            $value                 : locDescr,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : country,
            CollectionPath  : 'countryValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : country,
                ValueListProperty : 'country'
            }

            ]
        }
    });
    countryCode @(Common : {
        Text      : {
            $value                 : countryCode,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : countryCode,
            CollectionPath  : 'countryCodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : countryCode,
                ValueListProperty : 'countryCode'
            }

            ]
        }
    });
    plantType @(Common : {
        Text      : {
            $value                 : plantType,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : plantType,
            CollectionPath  : 'plantTypeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : plantType,
                ValueListProperty : 'plantType'
            }

            ]
        }
    });
    zplantType @(Common : {
        Text      : {
            $value                 : zplantType,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : zplantType,
            CollectionPath  : 'zplantTypeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : zplantType,
                ValueListProperty : 'zplantType'
            }

            ]
        }
    });
    locRegion @(Common : {
        Text      : {
            $value                 : locRegion,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locRegion,
            CollectionPath  : 'locRegionValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locRegion,
                ValueListProperty : 'locRegion'
            }

            ]
        }
    });
    locationAddress1 @(Common : {
        Text      : {
            $value                 : locationAddress1,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationAddress1,
            CollectionPath  : 'locationAddress1ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationAddress1,
                ValueListProperty : 'locationAddress1'
            }

            ]
        }
    });
    locationAddress2 @(Common : {
        Text      : {
            $value                 : locationAddress2,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationAddress2,
            CollectionPath  : 'locationAddress2ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationAddress2,
                ValueListProperty : 'locationAddress2'
            }

            ]
        }
    });
    city @(Common : {
        Text      : {
            $value                 : city,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : city,
            CollectionPath  : 'cityValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : city,
                ValueListProperty : 'city'
            }

            ]
        }
    });
    state @(Common : {
        Text      : {
            $value                 : state,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : state,
            CollectionPath  : 'stateValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : state,
                ValueListProperty : 'state'
            }

            ]
        }
    });
    zipcode @(Common : {
        Text      : {
            $value                 : zipcode,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : zipcode,
            CollectionPath  : 'zipcodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : zipcode,
                ValueListProperty : 'zipcode'
            }

            ]
        }
    });
    locationContact1Name @(Common : {
        Text      : {
            $value                 : locationContact1Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationContact1Name,
            CollectionPath  : 'locationContact1NameValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact1Name,
                ValueListProperty : 'locationContact1Name'
            }

            ]
        }
    });
    locationEmail1 @(Common : {
        Text      : {
            $value                 : locationEmail1,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationEmail1,
            CollectionPath  : 'locationEmail1ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationEmail1,
                ValueListProperty : 'locationEmail1'
            }

            ]
        }
    });
    locationContact2Name @(Common : {
        Text      : {
            $value                 : locationContact2Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationContact2Name,
            CollectionPath  : 'locationContact2NameValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact2Name,
                ValueListProperty : 'locationContact2Name'
            }

            ]
        }
    });
    locationEmail2 @(Common : {
        Text      : {
            $value                 : locationEmail2,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationEmail2,
            CollectionPath  : 'locationEmail2ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationEmail2,
                ValueListProperty : 'locationEmail2'
            }

            ]
        }
    });
    locationContact3Name @(Common : {
        Text      : {
            $value                 : locationContact3Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationContact3Name,
            CollectionPath  : 'locationContact3NameValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact3Name,
                ValueListProperty : 'locationContact3Name'
            }

            ]
        }
    });
    locationContact4Name @(Common : {
        Text      : {
            $value                 : locationContact4Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : locationContact4Name,
            CollectionPath  : 'locationContact4NameValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact4Name,
                ValueListProperty : 'locationContact4Name'
            }

            ]
        }
    });
    STRAS @(Common : {
        Text      : {
            $value                 : STRAS,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : STRAS,
            CollectionPath  : 'StreetHouseNumberValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : STRAS,
                ValueListProperty : 'STRAS'
            }

            ]
        }
    });
    TIME_ZONE @(Common : {
        Text      : {
            $value                 : TIME_ZONE,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : TIME_ZONE,
            CollectionPath  : 'AddressTimeZoneValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : TIME_ZONE,
                ValueListProperty : 'TIME_ZONE'
            }

            ]
        }
    });
    TELF1 @(Common : {
        Text      : {
            $value                 : TELF1,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : TELF1,
            CollectionPath  : 'FirstTelephoneNumberValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : TELF1,
                ValueListProperty : 'TELF1'
            }

            ]
        }
    });
    FABKL @(Common : {
        Text      : {
            $value                 : FABKL,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : FABKL,
            CollectionPath  : 'FactoryCalendarValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : FABKL,
                ValueListProperty : 'FABKL'
            }

            ]
        }
    });
    LIFNR @(Common : {
        Text      : {
            $value                 : LIFNR,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : LIFNR,
            CollectionPath  : 'VendorCreditAccountNumberValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : LIFNR,
                ValueListProperty : 'LIFNR'
            }

            ]
        }
    });
    KUNNR @(Common : {
        Text      : {
            $value                 : KUNNR,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : countryCode,
            CollectionPath  : 'CustomerNumberValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : KUNNR,
                ValueListProperty : 'KUNNR'
            }

            ]
        }
    });
    PSTLZ @(Common : {
        Text      : {
            $value                 : PSTLZ,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : countryCode,
            CollectionPath  : 'PostalCodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : PSTLZ,
                ValueListProperty : 'PSTLZ'
            }

            ]
        }
    });
    PSTL2 @(Common : {
        Text      : {
            $value                 : PSTL2,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : PSTL2,
            CollectionPath  : 'POBoxPostalCodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : PSTL2,
                ValueListProperty : 'PSTL2'
            }

            ]
        }
    });
    BUSINESS_UNIT @(Common : {
        Text      : {
            $value                 : BUSINESS_UNIT,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : BUSINESS_UNIT,
            CollectionPath  : 'BusinessUnitValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : BUSINESS_UNIT,
                ValueListProperty : 'BUSINESS_UNIT'
            }

            ]
        }
    });
    KUKLA @(Common : {
        Text      : {
            $value                 : KUKLA,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : KUKLA,
            CollectionPath  : 'CustomerClassificationValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : KUKLA,
                ValueListProperty : 'KUKLA'
            }

            ]
        }
    });
    DUMMY_TS_LOC @(Common : {
        Text      : {
            $value                 : DUMMY_TS_LOC,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : DUMMY_TS_LOC,
            CollectionPath  : 'DummyforIntegrationValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : DUMMY_TS_LOC,
                ValueListProperty : 'DUMMY_TS_LOC'
            }

            ]
        }
    });
    ETA_ETD @(Common : {
        Text      : {
            $value                 : ETA_ETD,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : ETA_ETD,
            CollectionPath  : 'ETAETDValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : ETA_ETD,
                ValueListProperty : 'ETA_ETD'
            }

            ]
        }
    });
    WERKS @(Common : {
        Text      : {
            $value                 : WERKS,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : WERKS,
            CollectionPath  : 'PlantValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : WERKS,
                ValueListProperty : 'WERKS'
            }

            ]
        }
    });
    PA_Name @(Common : {
        Text      : {
            $value                 : PA_Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : PA_Name,
            CollectionPath  : 'PlanningAreaValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : PA_Name,
                ValueListProperty : 'PA_Name'
            }

            ]
        }
    });
       
}