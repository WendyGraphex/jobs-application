<?php

return array(
   
    "items" => array(

        "3000_employees_admin" => array(           
            "childs" => array(               
                "49_employees.users.notation.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "49_employees.users.notation.admin" => array(
                "title" => "Notations",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_notation_ajax' => array('action' => 'ListNotation')),
                "enabled" => true,
            ),
        
        
        
         /* ====================================== S E T T I N G S =============================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                           "320_settings_employees_notation_category.admin" =>null,
                           "330_settings_employees_notation_criteria.admin" =>null,
                       )
                 ),  
        
          "320_settings_employees_notation_category.admin" => array(
                "title" => "Freelancer Notation Categories",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_notation_ajax' => array('action' => 'ListCategory')),
                "enabled" => true,
         ), 
        
         "330_settings_employees_notation_criteria.admin" => array(
                "title" => "Freelancer Notation Criterias",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_notation_ajax' => array('action' => 'ListCriteria')),
                "enabled" => true,
         ), 
    ),


);