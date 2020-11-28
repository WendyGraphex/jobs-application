<?php

return array(

    
    "items" => array(

        "3000_employees_admin" => array(         
            "childs" => array(             
                '67_employees_abuses_admin' => '',    
                 '69_employees_shares_admin' => '',    
                ),                
        ),

        
            "67_employees_abuses_admin" => array(
            "title" => "Abuses",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_contact_ajax' => array('action' => 'ListAbuse')),
            "enabled" => true,
                ),
        
             "69_employees_shares_admin" => array(
            "title" => "Shares",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_contact_ajax' => array('action' => 'ListShare')),
            "enabled" => true,
                ),
           
    ),


);