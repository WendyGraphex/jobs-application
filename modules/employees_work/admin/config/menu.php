<?php

return array(

   



    "items" => array(
         "3000_employees_admin" =>array(
             "childs" => array(
                '25_employees.works.admin' => '',
                   "27_employees.payments.admin" =>''
             )
         ),
        
         "25_employees.works.admin" => array(
            "title" => "Works",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_work_ajax' => array('action' => 'ListWork')),
            "enabled" => true,
        ),              
       
           "27_employees.payments.admin" => array(
            "title" => "Work payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_work_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ), 
          
    ),


);
