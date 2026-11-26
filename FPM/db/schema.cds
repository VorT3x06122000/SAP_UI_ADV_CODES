namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
  author : String;
}

entity EditDataSet {
            key ID : Integer;
            title  : String;
            stock  : Integer;
            author : String;
    };