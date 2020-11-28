<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('6100_customers_registration_admin' => ''),
        ),

    ),

    "items" => array(

         "6100_customers_registration_admin" => array(
            "title" => "Registrations",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
            "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                '00_customers_registrations_accounts_admin' => '',                
                 
                ),
               "enabled" => true,
        ),
        
         
         "00_customers_registrations_accounts_admin" => array(
            "title" => "Accounts",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_registration_ajax' => array('action' => 'ListRegistration')),
            "enabled" => true,
        ),
    ),


);
