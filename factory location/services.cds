
using from './psfaclocui/annotations';
using from './pstransfaclocui/annotations';

annotate FactoryLocationService.FactoryLocationView with {
    factoryNumber                   @(title : '{i18n>facNum}');
    locId                           @(title : '{i18n>locId}');
    locDescr                        @(title : '{i18n>locDesc}');
    locType                         @(title : '{i18n>locType}');
    @UI.HiddenFilter locTypeText    @(title : '{i18n>loctext}');
    zplantType                      @(title : '{i18n>zplntType}');
    locRegion                       @(title : '{i18n>locRgn}');
    locationAddress1                @(title : '{i18n>locAddr1}');
    locationAddress2                @(title : '{i18n>locAddr2}');
    city                            @(title : '{i18n>city}');
    state                           @(title : '{i18n>stat}');
    country                        @(title : '{i18n>cntry}');
    countryCode                     @(title : '{i18n>cntryCode}');
    zipcode                         @(title : '{i18n>zpcd}');
    locationContact1Name            @(title : '{i18n>locCon1}');
    locationEmail1                  @(title : '{i18n>locEmail1}');
    locationContact2Name            @(title : '{i18n>locCon2}');
    locationEmail2                  @(title : '{i18n>locEmail2}');
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate FactoryLocationService.CountryValueHelp with {
    country @(title : '{i18n>cntry}');
}

annotate FactoryLocationService.FactoryNumberValueHelp with {
    factoryNumber @(title : '{i18n>facNum}');
}

annotate FactoryLocationService.LocationIDValueHelp with {
    locId    @(title : '{i18n>locId}');
}

annotate FactoryLocationService.LocationDescrValueHelp with {
    locDescr @(title : '{i18n>locDesc}');
}

annotate FactoryLocationService.CityValueHelp with {
    city @(title : '{i18n>city}');
}

annotate FactoryLocationService.CountyCodeValueHelp with {
    countryCode @(title : '{i18n>cntryCode}');
}

annotate FactoryLocationService.LocAddr1ValueHelp with {
    locationAddress1 @(title : '{i18n>locAddr1}');
}

annotate FactoryLocationService.LocAddr2ValueHelp with {
    locationAddress2 @(title : '{i18n>locAddr2}');
}

annotate FactoryLocationService.LocCont1ValueHelp with {
    locationContact1Name @(title : '{i18n>locCon1}');
}

annotate FactoryLocationService.LocCont2ValueHelp with {
    locationContact2Name @(title : '{i18n>locCon2}');
}

annotate FactoryLocationService.LocEmail1ValueHelp with {
    locationEmail1 @(title : '{i18n>locEmail1}');
}

annotate FactoryLocationService.LocEmail2ValueHelp with {
    locationEmail2 @(title : '{i18n>locEmail2}');
}

annotate FactoryLocationService.LocRegionValueHelp with {
    locRegion @(title : '{i18n>locRgn}');
}

annotate FactoryLocationService.StateValueHelp with {
    state @(title : '{i18n>stat}');
}

annotate FactoryLocationService.ZipcodeValueHelp with {
    zipcode @(title : '{i18n>zpcd}');
}

annotate FactoryLocationService.FactoryLocationView with @(UI : {
    SelectionFields : [
        factoryNumber,
        locId,
        locDescr,
        locType,
        country,
        zplantType
    ],
    LineItem        : [
        {
            Value : factoryNumber,
            Label : '{i18n>facNum}',
        },
        {
            Value : locId,
            Label : '{i18n>locId}'
        },
         {
            Value : locDescr,
            Label : '{i18n>locDesc}'
        },
        {
            Value : locTypeText,
            Label : '{i18n>locType}'
        },
        {
            Value : country,
            Label : '{i18n>cntry}'
        },
         {
            Value : zplantType,
            Label : '{i18n>zplntType}'
        }
       
    ]
});

annotate FactoryLocationService.FactoryLocationView with {
    factoryNumber @(Common : {
        Text      : {
            $value                 : factoryNumber,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>facNum}',
            CollectionPath  : 'FactoryNumberValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : factoryNumber,
                ValueListProperty : 'factoryNumber'
            }

            ]
        }
    });

    locId         @(Common : {
        Text      : {
            $value                 : locId,
            ![@UI.TextArrangement] : #TextOnly

        },

        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locId}',
            CollectionPath  : 'LocationIDValueHelp',
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : locId,
                    ValueListProperty : 'locId'
                }

            ]
        }
    });
    locDescr         @(Common : {
        Text      : {
            $value                 : locDescr,
            ![@UI.TextArrangement] : #TextOnly

        },

        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locDesc}',
            CollectionPath  : 'LocationDescrValueHelp',
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : locDescr,
                    ValueListProperty : 'locDescr'
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
            Label           : '{i18n>locType}',
            CollectionPath  : 'FactoryLocationView',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locType,
                ValueListProperty : 'locType'
            }

            ]
        }
    });
    country      @(Common : {
        Text      : {
            $value                 : country,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>cntry}',
            CollectionPath  : 'CountryValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : country,
                ValueListProperty : 'country'
            }

            ]
        }
    });
    city      @(Common : {
        Text      : {
            $value                 : city,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>city}',
            CollectionPath  : 'CityValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : city,
                ValueListProperty : 'city'
            }

            ]
        }
    });

    countryCode      @(Common : {
        Text      : {
            $value                 : countryCode,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>cntryCode}',
            CollectionPath  : 'CountyCodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : countryCode,
                ValueListProperty : 'countryCode'
            }

            ]
        }
    });

    locationAddress1      @(Common : {
        Text      : {
            $value                 : locationAddress1,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locAddr1}',
            CollectionPath  : 'LocAddr1ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationAddress1,
                ValueListProperty : 'locationAddress1'
            }

            ]
        }
    });

    locationAddress2      @(Common : {
        Text      : {
            $value                 : locationAddress2,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locAddr2}',
            CollectionPath  : 'LocAddr2ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationAddress2,
                ValueListProperty : 'locationAddress2'
            }

            ]
        }
    });

    locationContact1Name      @(Common : {
        Text      : {
            $value                 : locationContact1Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locCon1}',
            CollectionPath  : 'LocCont1ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact1Name,
                ValueListProperty : 'locationContact1Name'
            }

            ]
        }
    });

    locationContact2Name      @(Common : {
        Text      : {
            $value                 : locationContact2Name,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locCon2}',
            CollectionPath  : 'LocCont2ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationContact2Name,
                ValueListProperty : 'locationContact2Name'
            }

            ]
        }
    });

    locationEmail1      @(Common : {
        Text      : {
            $value                 : locationEmail1,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locEmail1}',
            CollectionPath  : 'LocEmail1ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationEmail1,
                ValueListProperty : 'locationEmail1'
            }

            ]
        }
    });

    locationEmail2      @(Common : {
        Text      : {
            $value                 : locationEmail2,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locEmail2}',
            CollectionPath  : 'LocEmail2ValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locationEmail2,
                ValueListProperty : 'locationEmail2'
            }

            ]
        }
    });

    locRegion      @(Common : {
        Text      : {
            $value                 : locRegion,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>locRgn}',
            CollectionPath  : 'LocRegionValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locRegion,
                ValueListProperty : 'locRegion'
            }

            ]
        }
    });

    state      @(Common : {
        Text      : {
            $value                 : state,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>stat}',
            CollectionPath  : 'StateValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : state,
                ValueListProperty : 'state'
            }

            ]
        }
    });

    zipcode      @(Common : {
        Text      : {
            $value                 : zipcode,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>zpcd}',
            CollectionPath  : 'ZipcodeValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : zipcode,
                ValueListProperty : 'zipcode'
            }

            ]
        }
    });

};



annotate FactoryLocationService.LocationTransformationView with {
    Factory                   @(title : '{i18n>facNum}');
    VendorId                  @(title : '{i18n>vendrId}');
    VendorName                @(title : '{i18n>vendrName}');
    VendorGroup               @(title : '{i18n>vendrGrp}');
    locType                   @(title : '{i18n>locType}');
    @UI.HiddenFilter locTypeText;
    @UI.HiddenFilter Keeperflag;
    @UI.HiddenFilter markedforDeletion;
    @UI.Hidden markedforDeletion;
}

annotate FactoryLocationService.FactoryTransValueHelp with {
    Factory  @(title : '{i18n>facNum}');
}

annotate FactoryLocationService.VendorIDValueHelp with {
    VendorId @(title : '{i18n>vendrId}');
}

annotate FactoryLocationService.VendorNameValueHelp with {
    VendorName   @(title : '{i18n>vendrGrp}');
}

annotate FactoryLocationService.VendorGrpValueHelp with {
    VendorGroup @(title : '{i18n>locDesc}');
}


annotate FactoryLocationService.LocationTransformationView with @(UI : {
    SelectionFields : [
        Factory,
        VendorId,
        VendorName,
        VendorGroup,
        locType
    ],
    LineItem        : [
        {
            Value : Factory,
            Label : '{i18n>facNum}',
        },
        {
            Value : VendorId,
            Label : '{i18n>vendrId}'
        },
         {
            Value : VendorName,
            Label : '{i18n>vendrName}'
        },
        {
            Value : VendorGroup,
            Label : '{i18n>vendrGrp}'
        },
         {
            Value : locTypeText,
            Label : '{i18n>locType}'
        }
       
    ]
})
{
    Factory @(Common : {
        Text      : {
            $value                 : Factory,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>facNum}',
            CollectionPath  : 'FactoryTransValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Factory,
                ValueListProperty : 'Factory'
            }

            ]
        }
});

    VendorId         @(Common : {
        Text      : {
            $value                 : VendorId,
            ![@UI.TextArrangement] : #TextOnly

        },

        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>vendrId}',
            CollectionPath  : 'VendorIDValueHelp',
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : VendorId,
                    ValueListProperty : 'VendorId'
                }

            ]
        }
    });
    VendorName       @(Common : {
        Text      : {
            $value                 : VendorName,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>vendrName}',
            CollectionPath  : 'VendorNameValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : VendorName,
                ValueListProperty : 'VendorName'
            }

            ]
        }
    });
    VendorGroup      @(Common : {
        Text      : {
            $value                 : VendorGroup,
            ![@UI.TextArrangement] : #TextOnly

        },
        ValueList : {
            SearchSupported : true,
            Label           : '{i18n>vendrGrp}',
            CollectionPath  : 'VendorGrpValueHelp',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : VendorGroup,
                ValueListProperty : 'VendorGroup'
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
            Label           : '{i18n>locType}',
            CollectionPath  : 'LocationTransformationView',
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : locType,
                ValueListProperty : 'locType'
            }

            ]
        }
    });

};