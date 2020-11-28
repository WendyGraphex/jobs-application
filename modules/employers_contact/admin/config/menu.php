<?php

return array(

    
    "items" => array(

        "5000_employers_admin" => array(         
            "childs" => array(             
                '67_employers_abuses_admin' => '',    
                 '69_employers_shares_admin' => '',    
                ),                
        ),

        
            "67_employers_abuses_admin" => array(
            "title" => "Abuses",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employers_contact_ajax' => array('action' => 'ListAbuse')),
            "enabled" => true,
                ),
        
             "69_employers_shares_admin" => array(
            "title" => "Shares",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employers_contact_ajax' => array('action' => 'ListShare')),
            "enabled" => true,
                ),
           
    ),


);