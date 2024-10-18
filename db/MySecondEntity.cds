namespace emp1;


entity authors {
  key   Authors_Id :Int16;
        Authors_Name : String;
        Auth_DOB : Date;
        ava_books: Association to Books
}

entity Authors1 as projection on authors {
    *,
    ava_books[ stock > 0] as availableBooks             //> Publish Association With Filter

}

entity Address {
    key Add_Id : Integer;
       Add_Line1 : String;
       kind : String;
       Add_Line2 : type of  Add_Line1;
}

entity X_employee as projection on Employee {
    *,
    address[1: kind='Home'] as homeadd
}


entity Employee {
key Emp_Id : Integer;
    Add_Id;                    //> Forgine key
    Emp_Name : String;
    Emp_Phone : String;
  address : Association to many Address
}



@before entity xys @inner {
     @before simpleElement @(inner) : String @after;
     @before structElement @inner { /* element, element1 */ }
}


entity abc @(
     my.annotation : abc1, 
     another.one : 4711) 
     { /* element */}


     @my.annotation: 123
     @another.one : 4711
     entity rtyy {/* elements */}

     
     
     //> Annotation Targets 

     //>context and services
      @before define context foo1 @inner { /* element, element1 */ }    


//> definitions and element with simple types
@before define type foo @(inner) : String @after;


//> annotation values 
@flag//= true, 
@boolean:false
@aString:'abc'
@anInteger: 11
@aDecimal: 11.1
@aSymbol : #foo
@aRefrence: foo.bar
@anArray: [/* can contain any kind of values */]



//>  The EXTEND Directive

entity Books {
 key  Book_Id : Int16;
      Authors_Id :Int16;
      Book_Name : String;
      DateOFDeath : Date;
      ManagedObject;
      stock : Int16
} 


extend Books @(title: 'Books1' ) {
  NewField : String;
  NewField1 : Int16;
}



entity Doc_Header {
  Doc_ID : Int16;
  Doc_Name : String;
  Cust_Id : Int16;
}


extend Doc_Header { 
  ManagedObject;
}

aspect 
ManagedObject {
  created { at: Timestamp ;
             _Date: Date;}
}
