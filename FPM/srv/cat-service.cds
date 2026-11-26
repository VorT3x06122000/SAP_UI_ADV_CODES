using my.bookshop as my from '../db/schema';

service CatalogService {
    @readonly
    entity Books       as projection on my.Books;

    // entity SelectedRows as
    //     projection on Books {
    //         key ID : Integer,
    //         title  : String,
    //         stock  : Integer,
    //         author : String
    //     };

    type SelectedRows {
        ID     : Integer;
        title  : String;
        stock  : Integer;
        author : String;
    };

    entity EditDataSet as
        projection on my.EditDataSet {
            key ID     : Integer,
            title  : String,
            stock  : Integer,
            author : String,
        };


    action testAction()                                  returns String;
    action testActionWithUserInput(UserInput : String)   returns String;
    action selectedData(payload : array of SelectedRows) returns String;
}
