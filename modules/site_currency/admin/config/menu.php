<?php

return array(

   

    "items" => array(

           "6000_site_admin"=>array(
                     
                     "childs"=>array(
                                 "00_site_currency_admin"=>null,   
                     ),
                                       
                 ),  
        
           "00_site_currency_admin"=>array(
                    "title"=>"Currencies",
                    "icon_awe"=>"fa-dollar-sign",
                    "route_ajax"=>array("site_currency_ajax"=>array("action"=>"ListCurrency")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_emails')),
                    "enabled"=>true,      
                    ), 
    ),


);
