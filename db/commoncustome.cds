using {sap} from '@sap/cds/common';

//new codelist for regions

entity Regions : sap.common.CodeList {
    key code : String(5);
    country : Association to sap.common.Countries;
}

// bi-directionally associate with the countries
extend sap.common.Countries {
regions : Composition of many Regions on regions.country = $self;
}
