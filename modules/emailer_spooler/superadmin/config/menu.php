<?php


return array(

     "menu"=>array(                   
                  
                    "dashboard_home"=>array(                     
                       "childs"=>array("emailer_spooler"=>null),                                 
                      ),
  ),
    
    "items"=>array(   // SITE MENU STRUCTURE                                 
        
        
                 "dashboard_home"=>array(                     
                       "childs"=>array("emailer_spooler_site"=>null),                                 
                      ), 
         
         "emailer_spooler_site"=>array(
                             "title"=>"Email Spooler",
                             "route_ajax"=>array("emailer_spooler_ajax"=>array("action"=>"ListEmailForSite")),                  
                             "picture"=>"/pictures/icons/status32x32.png",
                             "help"=>"modify, add and delete status",    
                             "credentials"=>array(array('superadmin','admin','emailer_spooler')), 
                ),  
        
        
        "emailer_spooler"=>array(
                             "title"=>"Email Spooler",
                             "component"=>"/emailer_spooler/menuItem",
                             "route_ajax"=>array("emailer_spooler_ajax"=>array("action"=>"ListEmail")),                  
                             "picture"=>"/pictures/icons/status32x32.png",
                             "help"=>"modify, add and delete status",    
                             "credentials"=>array(), 
                ),  
   ),        
);
