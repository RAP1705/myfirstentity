

aspect sap.common.Codelist{
    name : localized String(111);
    descr : localized String(1111);
}

aspect sap.common.TextsAspect {
  key locale: String
}

//> Countries Entity
entity sap.common.Countries.CodeList {
  key code : String(3); //> ISO 3166-1 alpha-2 codes (or alpha-3)
}


//> Currencies Entity 
entity sap.common.Currency.CodeList{
    key code : String(3); //> ISO 4217 
        symbol : String(5);
        minorunit : Int16 ;    
}

//>Language Entity
entity sap.common.Languages.CodeList {
    key code : sap.common
}

