<?php

return array(
   
    "items" => array(

         "5000_employers_admin"  => array(           
            "childs" => array(               
                "30_employers.users.alerts.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "30_employers.users.alerts.admin" => array(
                "title" => "Alerts",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_alert_ajax' => array('action' => 'ListAlert')),
                "enabled" => true,
            ),
        
        
    ),


);