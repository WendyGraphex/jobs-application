<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "30_payments_zelle" =>null ,                   
                  "32_credits_zelle" =>null          
                ),        
        ),
                
         "30_payments_zelle" => array(
            "title" => "Zelle Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_zelle_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ),   
        
         "32_credits_zelle" => array(
            "title" => "Zelle credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_zelle_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ),   
    ),

);
