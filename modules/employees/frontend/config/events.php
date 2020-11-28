<?php

return array(

    "employee.advert.create" => array(
        "employees"=>array("EmployeeEvents","updateNumberOfAdverts"),
    ),

     "payment.accepted"=> array(
         "employees"=>array("EmployeeEvents","setQuotationPaid"),
    ),
);
