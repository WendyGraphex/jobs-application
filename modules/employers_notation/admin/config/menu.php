<?php

return array(
   
    "items" => array(

        "5000_employers_admin" => array(           
            "childs" => array(               
                "47_employers.users.notation.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "47_employers.users.notation.admin" => array(
                "title" => "Notations",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_notation_ajax' => array('action' => 'ListNotation')),
                "enabled" => true,
            ),
        
        
        /* ====================================== S E T T I N G S =============================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                           "620_settings_employees_notation_category.admin" =>null,
                           "630_settings_employees_notation_criteria.admin" =>null,
                       )
                 ),  
        
          "620_settings_employees_notation_category.admin" => array(
                "title" => "Employer Notation Categories",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_notation_ajax' => array('action' => 'ListCategory')),
                "enabled" => true,
         ), 
        
         "630_settings_employees_notation_criteria.admin" => array(
                "title" => "Employer Notation Criterias",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_notation_ajax' => array('action' => 'ListCriteria')),
                "enabled" => true,
         ), 
    ),


);