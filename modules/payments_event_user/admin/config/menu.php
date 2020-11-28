<?php

return array(

    
    "items" => array(
                "6500_site_event_admin"=>array(
                  
                     "childs"=>array("80_payments_debit_event_user_method_admin"=>null,
                                    '85_payments_debit_event_user_admin' => null,  
                         
                                    "90_payments_credit_event_user_method_admin"=>null,
                                    '95_payments_credit_event_user_admin' => null,  
                                ),
                                      
                 ),  
                  
                       
        "80_payments_debit_event_user_method_admin" =>array(
              "title" => "Payment Purchase Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_event_user_ajax' => array('action' => 'ListDebitMethod')),
            "enabled" => true,
         ),
        
        '85_payments_debit_event_user_admin' =>array(
              "title" => "Purchase Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_event_user_ajax' => array('action' => 'ListDebit')),
            "enabled" => true,
         ),
        
         "90_payments_credit_event_user_method_admin" =>array(
              "title" => "Payment Sale Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_event_user_ajax' => array('action' => 'ListCreditMethod')),
            "enabled" => true,
         ),
          '95_payments_credit_event_user_admin' =>array(
              "title" => "Sale Payments",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_event_user_ajax' => array('action' => 'ListCredit')),
            "enabled" => true,
         ),
    ),


);
