using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.SelectionFields #filterBarMacro : [
        ID,
        title,
        author,
    ],
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'Author',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/testAction',
            Label : 'Test Service Call',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/testActionWithUserInput',
            Label : 'Test Action with User Input',
        },
    ],
);
annotate service.Books with {
    ID @Common.Label : 'ID';
    stock @Common.Label : 'Stock';
    title @Common.Label : 'Title';
    author @Common.Label : 'Author'
};

annotate service.EditDataSet with @(
    UI.SelectionFields #filterBarMacro1 : [
        author,
        ID,
        title,
    ],
    UI.LineItem #tableMacro1 : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : author,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
    ],
);
annotate service.EditDataSet with {
    ID @Common.Label : 'ID';
    stock @Common.Label : 'Stock';
    title @Common.Label : 'Title';
    author @Common.Label : 'Author'
};
