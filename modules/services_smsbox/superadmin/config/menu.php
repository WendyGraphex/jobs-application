<?php

return array(

 "items"=>array(                  
              
      "site_admin"=>array(                   
                     "childs"=>array("services_smsbox"=>''),                   
                 ),   
     
      "services_smsbox"=>array(
                    "title"=>"SMS Box",
                    "route_ajax"=>array("services_smsbox_ajax"=>array("action"=>"List")),                  
                    "picture"=>"/module/services_smsbox/pictures/logo.png",
                    "help"=>"modify, add and delete site services smsbox",                 
                    ),   
  ),
);