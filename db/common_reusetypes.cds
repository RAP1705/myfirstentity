namespace reusetypes;

using { Country,temporal, cuid } from '@sap/cds/common';


entity Address {
street : String;
town : String;
country:Country  //>using reuse type
};



entity Contract : temporal { 
key contract_id : UUID;
vendor_name  : String;
country : Country               //> Using reuse type  
}


