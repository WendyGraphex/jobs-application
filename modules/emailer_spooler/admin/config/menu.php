<?php


return array(

    "items"=>array(   // SITE MENU STRUCTURE                                 
            
                                   
         "8500_communication_admin"=>array(
                   "childs"=>array("emailer_spooler"=>null),                                 
                 ),  
                     
        
         "emailer_spooler"=>array(
                             "title"=>"Email Spooler",
                             "route_ajax"=>array("emailer_spooler_ajax"=>array("action"=>"ListEmail")),                  
                           //  "picture"=>"/pictures/icons/status32x32.png",
                           //  "help"=>"modify, add and delete status",    
                             "credentials"=>array(array('superadmin','emailer_spooler')), 
                ),   
   ),        
);