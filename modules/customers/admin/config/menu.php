<?php

return array(

   "menu" => array(
        "dashboard" => array(
            "childs" => array('5500_customers_admin' => ''),
        ),

    ),


    "items" => array(

         "5500_customers_admin" => array(
            "title" => "Customers",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
            "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                  '00_customers_contacts_admin' => '',    
              //  '10_customers_accounts_admin' => '',                
             //   "80_customers_sessions_admin" => '',
              //  '90_customers.settings.admin' => ''),             
                ),
               "enabled" => true,
        ),
        
        
         "00_customers_contacts_admin" => array(
            "title" => "Claim Contacts",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_ajax' => array('action' => 'ListContact')),
            "enabled" => true,
        ),              
       
         "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                       
                          "400_settings_customers.claim_type.admin"=>"",
                        
                        
                       )
                 ),  
          "400_settings_customers.claim_type.admin" => array(
                "title" => "Claim Types",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_ajax' => array('action' => 'ListType')),
                "enabled" => true,
         ), 
    ),


);
