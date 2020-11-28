<?php

return array(

    
    "items" => array(

        
         "5500_customers_admin" => array(          
            "childs" => array(
                 "20_customers_messager_admin"=>null,  
                "23_customers_admin_messager_admin" => null,
                ),       
        ),
        
        
         "20_customers_messager_admin" => array(
            "title" => "Messager",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-envelope fa-2x",
             "route_ajax" => array('customers_messager_ajax' => array('action' => 'ListMessage')),            
            "enabled" => true,
        ), 
        
        
         "23_customers_admin_messager_admin" => array(
            "title" => "Admin. Messager",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-envelope fa-2x",
             "route_ajax" => array('customers_messager_ajax' => array('action' => 'ListAdminMessage')),            
            "enabled" => true,
        ), 
       
    ),


);
