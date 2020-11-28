<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('6000_customers_contact_admin' => ''),
        ),

    ),

    "items" => array(

         "6000_customers_contact_admin" => array(
            "title" => "Contacts",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
            "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                '00_customers_contacts_accounts_admin' => '',                
             //   "10_customers_contacts_requests_admin" => '',            
                "20_customers_contacts_abuse_admin" => '',            
                ),
               "enabled" => true,
        ),
        
         "00_customers_contacts_accounts_admin" => array(
            "title" => "Accounts",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_contact_ajax' => array('action' => 'ListContact')),
            "enabled" => true,
        ),
        
     /*   "10_customers_contacts_requests_admin"=>array(
                     "title"=>"Requests",
                     "icon_awe" => "fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('customers_contact_ajax'=>array('action'=>'ListRequest')),
                     "enabled"=>true,
        ), */

                                
        
         /* ====================================== S E T T I N G S =============================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                          "300_settings_customers_abuse_type.admin"=>null,
                        
                       )
                 ),  
        
        
         "300_settings_customers_abuse_type.admin" => array(
                "title" => "Customer Abuse Types",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_contact_ajax' => array('action' => 'ListAbuseType')),
                "enabled" => true,
         ), 
    ),


);
