<?php


return array(
    "items" => array(

         "9000_system_admin"=>array(
                     "childs"=>array(
                         "10_system_nodejs_settings"=>null,
                     )                                
                 ), 
        
           "10_system_nodejs_settings"=>array(
                    "title"=>"NodeJs",
                    "icon_awe"=>"fa-dollar-sign",
                    "route_ajax"=>array("utils_nodejs_ajax"=>array("action"=>"Settings")),        
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
    ),
    
  
);