<?php

return array(

           
 "items"=>array(    
                
                        
      "9000_system_admin"=>array(
                     "childs"=>array("20_system_emails_admin"=>''),                                      
                 ),
     
     
      "20_system_emails_admin"=>array(
                    "title"=>"Emails Models",
                    "icon_awe"=>"fa-user fa-2x",
                    "route_ajax"=>array("system_emails_ajax"=>array("action"=>"ListModel")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
   ),  
    
);