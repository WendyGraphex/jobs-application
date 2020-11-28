<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "15_payments_bankwire" =>null    ,
                    "15_credits_bankwire" =>null,                
                ),        
        ),
                
         "15_payments_bankwire" => array(
            "title" => "Bankwire Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_bankwire_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ),  
        
          "15_credits_bankwire" => array(
            "title" => "Bankwire credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_bankwire_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ), 
    ),

);
