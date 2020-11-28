<?php

return array(
          
    "items"=>array(
                                           
            "6000_site_admin"=>array(
                    "childs"=>array('70_site_cookie_admin'=>''),                                   
                 ),  
                         
           "70_site_cookie_admin"=>array(
                    "title"=>"Cookies",
                    "icon_awe"=>"fa-eur",
                    "route_ajax"=>array("site_cookie_ajax"=>array("action"=>"List")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
        
  ),
);