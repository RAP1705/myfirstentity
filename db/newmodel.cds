namespace newmodel;


entity mat_hdr{
  key  Mat_ID : Int16;
       mat_name :String;   
}                                          //>newmodel.mat_det
context material_dev {
    entity mat_item{  
      key   Mat_ID;
            mat_name;
            supplier_name:String
    }                                    //>newmodel.material_dev.mat_item
    context nested {
       entity mat_sto    {
        Mat_ID;
        mat_sto : String
       }
    }                                     //> newmodel.material_dev.nested.xyz             

}
