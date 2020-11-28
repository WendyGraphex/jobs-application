<?php

return array(

    
    "items" => array(

        "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(
                          "060_settings_site_city.admin"=>"",                         
                       )
                 ),  

         "060_settings_site_city.admin" => array(
                "title" => "Cities",
                "icon_awe" => "fa-buildings",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('site_city_ajax' => array('action' => 'ListCity')),
                "enabled" => true,
         ), 
       
    ),


);