<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "30_payments_wu" =>null ,
                  "30_credits_wu" => null,
                ),        
        ),
                
         "30_payments_wu" => array(
            "title" => "Western Union Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_wu_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ),   
        
         "30_credits_wu" => array(
            "title" => "Western Union credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_wu_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ), 
    ),

);
