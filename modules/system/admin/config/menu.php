<?php

return array(

           
 "items"=>array(    
                
                        
       "97_system.admin"=>array(
                     "childs"=>array('98_system.admin'=>''),                                      
                 ),  
     
     
      "98_system.admin"=>array(
                    "title"=>"Settings",
                    "icon_awe"=>"fa-cog",
                    "route_ajax"=>array("system_ajax"=>array("action"=>"Settings")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
   ),  
    
);