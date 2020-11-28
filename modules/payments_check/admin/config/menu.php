<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "20_payments_check" =>null,
                 "20_credits_check" =>null,
                ),        
        ),
                
         "20_payments_check" => array(
            "title" => "Check Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_check_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ),  
        
          "20_credits_check" => array(
            "title" => "Check credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_check_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ), 
    ),

);
