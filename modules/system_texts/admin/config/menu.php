<?php

return array(

           
 "items"=>array(    
                
                        
      "9000_system_admin"=>array(
                     "childs"=>array('10_system.texts.admin'=>''),                                      
                 ),  
     
     
      "10_system.texts.admin"=>array(
                    "title"=>"Texts Models",
                    "icon_awe"=>"fa-user fa-2x",
                    "route_ajax"=>array("system_texts_ajax"=>array("action"=>"ListModel")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_texts')),
                    "enabled"=>true,      
                    ), 
   ),  
    
);