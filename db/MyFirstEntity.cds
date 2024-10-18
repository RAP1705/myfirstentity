namespace emp;
using { Currency } FROM '@sap/cds/common';


type ammount {
    value : Decimal;
    currency : Currency;
}


entity Employee {
    key Emp_Id : Integer;
    Add_Id;                    //> Forgine key
    Emp_Name : String;
    Emp_Phone : String;
  address : Association to many Emp2Add on address.emp = $self;
}

entity Employee1 as projection on Employee { 
   key Emp_Id,
    Emp_Name,
    address
 }                                           //> Publish Association in Projection
entity Address {
    key Add_Id : Integer;
       Add_Line1 : String;
       Add_Line2 : type of  Add_Line1;
       NewAsso : Association to Cust_det;   //> The Backlink
}

Entity Emp2Add {
    key emp : Association to Employee;
    key adr : Association to Address;
}

//> Expose entity in service with parameter
Entity Orders {
    key Order_Id : Int16;
    Items : Composition of many OrderItems on Items.Parent = $self;
}


entity OrderItems {
    Key Prod_Id ;
   key Parent :Association to Orders;
}

entity Cust_det {
    Cust_Id : Integer;
    Cust_Name : String;
    add : Association to many Address on add.NewAsso = $self;   //> One To Many Association
    }


entity Emp_salDet {
    Emp_Id : Integer not null;
    Sal   : ammount; 
    Sal_Date : Date;
    add : Association to  Address;  //> Managed (To-One) Association
}

entity Emp_ProDet {
  key  Emp_Id;
  key  pro_id : type of Emp_Id;
       Emp_Name ;
       Pro_Name : String;
}

entity abc as select from Employee left join Emp_salDet on Employee.Emp_Id=Emp_salDet.Emp_Id
{

    Sal ,
    Sal_Date,
    Emp_Name,
}

entity e2 (
f1 : Integer,
f2 : String,
F3 : Boolean,
)
as select * from Employee where Emp_Id=:f1;    


entity Order_Hdr { 
    key Order_Id;
    Items : Composition of many Order_Items on Items.Order_Id = $self  //> Unmanaged Composition 
}


entity Order_Items {
    key Item_ID : Int16;
    key Order_Id : Association to Order_Hdr;
}



entity Orders1 { 
    key Order_Id;
    Items1 : Composition of many OrderItems1;   //> Managed Composition With Name Targets
}
aspect OrderItems1{
    key Item_ID;
    add1 : Association  to Address;
}

entity Teams {
 key TID : Int16;
 members : Composition  of many {
    key user : Association to users
 }
}
 entity users {
    UID : Int16 ;
    teams : Association to many Teams.members on teams.user = $self
 }


 entity Org_Det {
   key Org_ID : Int16;
    venders : Composition of many { 
        key vendtoorg : Association to vend_det;
    }
 }

 entity vend_det { 
    vend_ID : Int16;
 }


entity authors {
  key   Authors_Id :Int16;
        Authors_Name : String;
        ava_books : Association to Books
}

entity Books {
 key  Book_Id : Int16;
      Book_Name : String;
      stock : Int16
} 

entity Authors1 as projection on authors {
    *,
    ava_books[ stock > 0] as availableBooks             //> Publish Association With Filter
}


