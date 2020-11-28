<?php

return array(
    
    
 "items"=>array(                  
              
     "9000_system_admin"=>array(
                     "childs"=>array(
                         "10_system_resources_settings"=>null,
                     )                                
                 ), 
     
    "10_system_resources_settings"=>array(
                    "title"=>"Resources",
                    "icon_awe"=>"fa-building",
                    "route_ajax"=>array("system_resources_ajax"=>array("action"=>"Settings")),                  
                  //  "picture"=>"/pictures/icons/toolsbox32x32.png",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','settings_system_resources')),
                    "enabled"=>true,      
                    ), 
   ),  
     
 
);