<?php

return array(

   "menu" => array(
        "dashboard" => array(
            "childs" => array('7000_payments_admin' => ''),
        ),

    ),


    "items" => array(

         "7000_payments_admin" => array(
            "title" => "Payments",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-dollar-sign fa-2x",
          //  "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(                 
                  "90_payments_method_admin" =>null,
              //    "95_payments_text_admin" =>null,      
                  "99_payments_settings_admin" =>null,      
                ),
               "enabled" => true,
        ),                
        
        
                   
              
          "90_payments_method_admin" => array(
            "title" => "Payment Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_ajax' => array('action' => 'ListMethod')),
            "enabled" => true,
        ), 
        
        
         "95_payments_text_admin" => array(
            "title" => "Texts",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_ajax' => array('action' => 'ListText')),
            "enabled" => true,
        ), 
        
        "99_payments_settings_admin" => array(
            "title" => "Settings",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_ajax' => array('action' => 'Settings')),
            "enabled" => true,
        ), 
    ),


);
