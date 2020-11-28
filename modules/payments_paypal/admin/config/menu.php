<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "30_payments_paypal" =>null  ,
                "30_credits_paypal" => null
                ),        
        ),
                
         "30_payments_paypal" => array(
            "title" => "Paypal Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_paypal_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ), 
        
         
         "30_credits_paypal" => array(
            "title" => "Paypal credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_paypal_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ), 
    ),

);
