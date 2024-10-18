using  { emp as emp1 } From '../db/MyFirstEntity';


service  employee_srv {

   entity Employee as projection on emp1.Employee;

   entity  parameter( p1: Integer ) as select from Employee where Emp_Id=:p1;
      
      entity Employees as projection on Employee {
  Emp_Id,
  address
}
};


service MyService {

   entity entity1 as projection on emp1.authors{ 
      *, Authors_Id as Id
   }

}


//> Expose Entity With Parameter 

service order {
   @readonly entity order_detailsP( Parmeter1: Integer) as select from emp1.Orders where Order_Id=:Parmeter1
}



//> Custome Action and Functions 
service  myorders {
entity Orders { 
Order_Id;
}
type cancelorderret{
   acknowloedge: String enum { succeeded; failed;};
   message:String;
}
action cancelorder( Order_Id:Integer, reason:String) returns cancelorderret;
function countOrders() returns Integer;
function getopenorders() returns array of Orders;
}

//> Custom-Defined Events

service events  {
entity Orders {
   Order_Id
}
event OrderCanceled {
   Order_Id : Integer;
   reason:String
}  
}

service sfgsg {
select from Authors { name, address.street }
}



