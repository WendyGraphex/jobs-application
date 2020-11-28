<?php

return array(
   
    "items" => array(

        "3000_employees_admin" => array(           
            "childs" => array(               
                "30_employees.users.alerts.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "30_employees.users.alerts.admin" => array(
                "title" => "Alerts",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_alert_ajax' => array('action' => 'ListAlert')),
                "enabled" => true,
            ),
        
        
    ),


);