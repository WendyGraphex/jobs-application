<?php

return array(

    "items" => array(

         "7000_payments_admin" => array(
            "childs" => array(
                  "30_payments_withdrawal" =>null      ,
                "30_credits_withdrawal" =>null,
                ),        
        ),
                
         "30_payments_withdrawal" => array(
            "title" => "Withdrawal Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_withdrawal_ajax' => array('action' => 'ListPayment')),
            "enabled" => true,
        ),  
        
         "30_credits_withdrawal" => array(
            "title" => "Withdrawal credits",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_withdrawal_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
        ), 
    ),

);
