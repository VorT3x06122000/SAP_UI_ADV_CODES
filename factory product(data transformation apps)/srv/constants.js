const ERROR_STATUS_CODE = 400;
const ACCEPT_STATUS_CODE = 202;
const RESULT_STATUS_CODE = 201;
const SUCCESS_STATUS_CODE = 200;

const CONSTCRUD = {
    Create: "CREATE",
    Delete: "DELETE",
}

const PRODUCT = [
    "*FACTORY_NUMBER",
    "*PRODID",
    "*PRODDESC",
    "ZMPA_PARTNO",
    "ZHP_PARTNO",
    "*BASE_UNIT_OF_MEASURE",
    "MATERIAL_TYPE",
    "ZPLC_STATUS",
    "unspscCode",
    "*zhfvType",
    "*zhfvValue",
    "zintroDate",
    "*category",
    "materialGroup",
    "gatingAttribute",
    "markedforDeletion"
];

const FACTORY_LOCATION = [
    "*FACTORY_NUMBER",
    "*LOCID",
    "LOCDESCR",
    "*LOCTYPE",
    "ZPLANTTYPE",
    "LOCREGION",
    "LocationAddress1",
    "LocationAddress2",
    "City",
    "State",
    "Country",
    "CountryCode",
    "Zip_code",
    "Location_contact1_Name",
    "Location_email1",
    "Location_contact2_Name",
    "Location_email2",
    "MARKEDFORDELETION"
];

const PRODUCT_LOCATION = [
    "*FACTORY_NUMBER",
    "*LOCID",
    "*prodId",
    "ZMANU_NAME",
    "EM",
    "*PROCUREMENT_TYPE",
    "*GRprocessingTime",
    "*ZTARGET_BUFFER",
    "ZCANCEL_WINDOW",
    "PLANNEDDELIVERYTIME",
    "*zinHouseLeadTime",
    "*soleSourceFlag",
    "outSource",
    "foundry1",
    "foundry1Site",
    "foundry1Country",
    "foundry2",
    "foundry2Site",
    "foundry2Country",
    "waferSize",
    "nodeProcess",
    "nodeprocessGroup",
    "packingHouse1",
    "packingHouse1Country",
    "packingHouse2",
    "packingHouse2Country",
    "packingType",
    "pin",
    "packageSize",
    "testingHouse1",
    "testingHouse1Country",
    "testingHouse2",
    "testingHouse2Country",
    "MARKEDFORDELETION"
];

const UOM = [
    "*FACTORYNUMBER",
    "*PRODID",
    "*UOM_ALT",
    "*DENOMINATOR",
    "*NUMERATOR"
];

const T_LANE = [
    "*FACTORY_NUMBER",
    "*PRODID",
    "*LOCFR",
    "*LOCFRTYPE",
    "*LOCTO",
    "*LOCTOTYPE",
    "*MOT",
    "*VALIDTO",
    "*VALIDFROM",
    "*LEADTIME",
    "CoO",
    "*lotSize",
    "*MOQ",
    "PPRIORITY",
    "ZQUOTA",
    "SPQ",
    "Sourcing_Model",
    "MARKEDFORDELETION"
];

const TEMPLATE_LIST = [
    {ID: 'Factory_Product', value: 'Factory Product'},
    {ID: 'Factory_Location', value: 'Factory Location'},
    {ID: 'Product_Location', value: 'Product Location'},
    {ID: 'UOM', value: 'UOM'},
    {ID: 'T_Lane', value: 'T Lane'}
];

const TEMPLATE_INFO = [
    {ID: 'Factory_Product', value: 'factoryproduct', payload: 'I_PAYLOAD'},
    {ID: 'Factory_Location', value: 'factorylocation', payload: 'I_PAYLOAD'},
    {ID: 'Product_Location', value: 'factoryproductlocation', payload: 'I_PAYLOADPRODLOC'},
    {ID: 'UOM', value: 'factoryuom', payload: 'I_UOMPAYLOAD'},
    {ID: 'T_Lane', value: 'factorytlane', payload: 'I_TLANEPAYLOAD'},
];


module.exports = {
    ERROR_STATUS_CODE,
    CONSTCRUD,
    PRODUCT,
    FACTORY_LOCATION,
    PRODUCT_LOCATION,
    UOM,
    T_LANE,
    TEMPLATE_LIST,
    TEMPLATE_INFO,
    ACCEPT_STATUS_CODE,
    RESULT_STATUS_CODE,
    SUCCESS_STATUS_CODE
};