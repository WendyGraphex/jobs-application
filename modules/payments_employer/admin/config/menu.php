<?php

return array(

    
    "items" => array(

         "7000_payments_admin" => array(          
            "childs" => array(               
                "00_payments_employer_admin" => null,
                  "80_payments_employer_method_admin" =>null,                
                ),              
        ),                
                       
        "80_payments_employer_method_admin" =>array(
              "title" => "Payment Employer Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_employer_ajax' => array('action' => 'ListMethod')),
            "enabled" => true,
         ),
         
           "00_payments_employer_admin" => array(
            "title" => "Employer Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_employer_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ), 
    ),


);
