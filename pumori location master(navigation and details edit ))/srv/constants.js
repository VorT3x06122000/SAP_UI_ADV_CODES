const ERROR_STATUS_CODE = 400;
const SUCCESS_STATUS_CODE = 200;
const RESULT_STATUS_CODE = 201;
const ACCEPT_STATUS_CODE = 202;
const CHUNK_SIZE = 1000;
const BATCH_SIZE = 5000;

const CONSTPROPS = { 
    LocTypeP: "P",
    LocTypeV: "V",
    DelFlagY: "Y",
    DelFlagy: "y",
    ZPlantTyypeFactories: "Factories",
    ZPlantTyypeSuppliers: "Suppliers",
    ZPlantTyypeHP: "HP",
    Pending: "Pending",
    factoryCalender: "W8",
    BGPrint: "Print",
    CommmonApp: "Common",
    Factory: "Factory",
    HP: "HP"
}
const PUMLOCCONST = {
    locId : "Location ID",
    locType : "Location Type",
    zsupplierName : "Manufacturer Name",
    zlocPriority : "Location Priority",
    zMarket : "Market Unit",
    zGoc : "Group Of Countries",
    vendorGroup: "Vendor Group",
    keeperflag :"Keeper Flag"
}
const CONFIG_PARAMS = [
    'chunkSize',
    'pendingValue',
    'factoryCalender',
    'locTypeV',
    'delFlagY',
    'delFlag'
]
const CONFIG_KEYS = {
    chunkSize: "chunkSize",
    pendingValue: "pendingValue",
    factoryCalender: "factoryCalender",
    locTypeV: "locTypeV",
    delFlagY: "delFlagY",
    delFlag: "delFlag"
}
module.exports = {
    ERROR_STATUS_CODE,
    SUCCESS_STATUS_CODE,
    RESULT_STATUS_CODE,
    ACCEPT_STATUS_CODE,
    CHUNK_SIZE, BATCH_SIZE,
    CONSTPROPS,
    CONFIG_PARAMS, CONFIG_KEYS,
    PUMLOCCONST
};