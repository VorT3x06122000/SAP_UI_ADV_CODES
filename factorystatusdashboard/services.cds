
using from './pumorifacstatusdashboard/annotations';

annotate PumoriConfigService.FactoryStatusDashboard with @(Capabilities : {
    FilterRestrictions : {
        FilterExpressionRestrictions : [{
    $Type              : 'Capabilities.FilterExpressionRestrictionType',
    Property           : date,
    AllowedExpressions : 'SingleRange'
}]
}
});


annotate PumoriConfigService.interfaceValueHelp with {
    interface               @(title : '{i18n>interface}');
}

annotate PumoriConfigService.factoryIdValueHelp with {
    factoryId               @(title : '{i18n>factoryId}');
}

annotate PumoriConfigService.dateValueHelp with {
    date                    @(title : '{i18n>date}');
}

annotate PumoriConfigService.fileNameValHelp with {
    fileName                @(title : '{i18>fileName}');
}

annotate PumoriConfigService.processTimeValHelp with {
    processTime              @(title : '{i18>processTime}');
}

annotate PumoriConfigService.statusValHelp with {
    status                  @(title : '{i18>status}');
}

annotate PumoriConfigService.prococessingValHelp with {
    prococessing            @(title : '{i18>prococessing}');
}

annotate PumoriConfigService.FactoryStatusDashboard with {
    factoryId               @(title : '{i18n>factoryId}');
    interface               @(title : '{i18n>interface}');
    fileName                @(title : '{i18n>fileName}');
    date                    @(title : '{i18n>date}');
    processTime             @(title : '{i18n>processTime}');
    status                  @(title : '{i18n>status}');
    records                 @(title : '{i18n>records}');
    successfulRecords       @(title : '{i18n>successfulRecords}');
    errorRecords            @(title : '{i18n>errorRecords}');
    prococessing            @(title : '{i18n>prococessing}');
    uploadedtime            @(title : '{i18n>uploadedtime}');
}

annotate PumoriConfigService.FactoryStatusDashboard with@(UI:{
    SelectionFields  : [

        factoryId,
        interface,
        date 
        
    ],
    LineItem  : [
        {
            Value: factoryId,
            Label: '{i18n>factoryId}'
        },
        {
            Value: interface,
            Label: '{i18n>interface}'
        },
        {
            Value: fileName,
            Label: '{i18n>fileName}'
        },
        {
            Value: date,
            Label: '{i18n>date}'
        },
        {
            Value: processTime,
            Label: '{i18n>processTime}'
        },
        {
            Value: status,
            Label: '{i18n>status}'
        },
        {
            Value: records,
            Label: '{i18n>records}'
        },
        {
            Value: successfulRecords,
            Label: '{i18n>successfulRecords}'
        },
        {
            Value: errorRecords,
            Label: '{i18n>errorRecords}'
        },
        {
            Value: prococessing,
            Label: '{i18n>prococessing}'
        },
        {
            Value: uploadedtime,
            Label: '{i18n>uploadedtime}'
        }
    ]
}){
    factoryId        @(Common: {
        Text     : {
            $value                : factoryId,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>factoryId}',
            CollectionPath : 'factoryIdValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: factoryId,
                ValueListProperty: 'factoryId'
            }]
        }
    });

    interface        @(Common: {
        Text     : {
            $value                : interface,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>interface}',
            CollectionPath : 'interfaceValueHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: interface,
                ValueListProperty: 'interface'
            }]
        }
    });
    date ;
    fileName        @(Common: {
        Text     : {
            $value                : fileName,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>fileName}',
            CollectionPath : 'fileNameValHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: fileName,
                ValueListProperty: 'fileName'
            }]
        }
    });

    processTime        @(Common: {
        Text     : {
            $value                : processTime,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>processTime}',
            CollectionPath : 'processTimeValHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: processTime,
                ValueListProperty: 'processTime'
            }]
        }
    });

    status        @(Common: {
        Text     : {
            $value                : processTime,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>status}',
            CollectionPath : 'statusValHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status,
                ValueListProperty: 'status'
            }]
        }
    });

     prococessing        @(Common: {
        Text     : {
            $value                : prococessing,
            ![@UI.TextArrangement]: #TextOnly
        },
        ValueList: {
            SearchSupported: true,
            Label          : '{i18n>prococessing}',
            CollectionPath : 'prococessingValHelp',
            Parameters     : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: prococessing,
                ValueListProperty: 'prococessing'
            }]
        }
    });
};