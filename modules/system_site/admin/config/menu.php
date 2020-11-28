<?php

return array(

           
 "items"=>array(    
                
                        
       "97_system.admin"=>array(
                     "childs"=>array('99_system.site.admin'=>''),                                      
                 ),  
     
     
      "99_system.site.admin"=>array(
                    "title"=>"Information",
                    "icon_awe"=>"fa-user fa-2x",
                    "route_ajax"=>array("system_site_ajax"=>array("action"=>"ViewInformation")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
   ),  
    
);