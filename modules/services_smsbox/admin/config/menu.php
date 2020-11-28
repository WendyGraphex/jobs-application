<?php

return array(

 "items"=>array(                  
         "8500_communication_admin"=>array(
                   "childs"=>array("services_smsbox"=>null),                                 
                 ),  
     
     "services_smsbox"=>array(
                     "title"=>"SMS",
                     "route_ajax"=>array("services_smsbox_ajax"=>array("action"=>"ListSmsBox")),
                     "icon_awe" => "fa-envelope",
                  //   "help"=>"modify, add and delete site services smsbox",
                  //  "credentials"=>array(array('superadmin','admin','settings_smsbox')),
                 /*   "childs" => array(
                        '10_services_smsbox_list' => null,
                        '20_services_smsbox_test' => null
                    ),*/
                    "enabled" => true,
                   ),  
     
     
       /* =============DASHBOARD TAB => MENU ============  */



     
   /*   "97_system.admin"=>array(
                   "childs"=>array( "90_site_configuration_services_smsbox_model"=>null
                        )
               ),

     "90_site_configuration_services_smsbox_model"=>array(
         "title"=>"Modèle SMS Box",
         "icon_awe"=>"fa-bookmark",
         "credentials"=>array(array('superadmin','admin','settings_smsbox_model')),
         "route_ajax"=>array('services_smsbox_ajax'=>array('action'=>'ListModel')),
         "enabled"=>true,
     ),

     "10_services_smsbox_list"=>array(
         "title"=>"SMS Box",
         "route_ajax"=>array("services_smsbox_ajax"=>array("action"=>"ListSmsBox")),
         "icon_awe" => "fa-envelope",
         "help"=>"modify, add and delete site services smsbox",
         "credentials"=>array(array('superadmin','admin','settings_smsbox')),
     ),
     "20_services_smsbox_test"=>array(
         "title"=>"Test",
         "route_ajax"=>array("services_smsbox_ajax"=>array("action"=>"Test")),
         "icon_awe" => "fa-envelope",
         "help"=>"modify, add and delete site services smsbox",
         "credentials"=>array(array('superadmin','admin','settings_smsbox')),
     ),*/



 ),
    
    
);