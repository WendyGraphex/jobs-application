<?php

return array(

    "items" => array(
         
        "7000_payments_admin" => array(          
            "childs" => array(
                  '12_payments_employee_admin' => null,  
                  "85_payments_employee_method_admin" =>null,
                ),          
        ),
        
         "12_payments_employee_admin" => array(
            "title" => "Employee Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_employee_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ), 
                
        "85_payments_employee_method_admin" =>array(
              "title" => "Payment Employee Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_employee_ajax' => array('action' => 'ListMethod')),
            "enabled" => true,
         ),
         
    ),


);
