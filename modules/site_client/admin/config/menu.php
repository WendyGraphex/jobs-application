<?php

return array(

  "items"=>array(
      
        "6000_site_admin"=>array(
                     "childs"=>array('10_site.clients.admin'=>''),              
                                       
                 ),  
     
     
      "10_site.clients.admin"=>array(
                    "title"=>"Clients",
                    "icon_awe"=>"fa-globe",
                    "route_ajax"=>array("site_client_ajax"=>array("action"=>"List")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_texts')),
                    "enabled"=>true,      
                    ), 

  ),
);
