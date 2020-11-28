<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('7900_customer_academy_admin' => ''),
        ),

    ),



    "items" => array(

         "7900_customer_academy_admin" => array(
            "title" => "Academy",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-graduation-cap fa-2x",
          //  "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                 
                  '000_customer_academy_courses_admin' => null,                  
                  '050_customer_academy_populars_admin' => null,  
                  '850_customer_academy_contacts_admin' => null,                    
                  '900_customer_academy_courses_category_admin' => null,  
                  '999_customer_academy_courses_settings_admin' => null,  
                ),
               "enabled" => true,
        ),                
        
       
        
         "000_customer_academy_courses_admin" => array(
            "title" => "Courses",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_academy_ajax' => array('action' => 'ListCourse')),
            "enabled" => true,
        ),              
       
        '050_customer_academy_populars_admin' =>array(
             "title" => "Popular Courses",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_academy_ajax' => array('action' => 'ListPopular')),
            "enabled" => true,
        ),
        
         '850_customer_academy_contacts_admin' =>array(
             "title" => "Contacts",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_academy_ajax' => array('action' => 'ListContact')),
            "enabled" => true,
        ),
          "900_customer_academy_courses_category_admin" => array(
                "title" => "Course Categories",
                "icon_awe" => "fa-list",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_academy_ajax' => array('action' => 'ListCategory')),
                "enabled" => true,
         ), 
        
          "999_customer_academy_courses_settings_admin" => array(
                "title" => "Settings",
                "icon_awe" => "fa-cog",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_academy_ajax' => array('action' => 'Settings')),
                "enabled" => true,
         ), 
         
        /* =================================================================================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                          "800_settings_customer_academy_level.admin"=>null,                          
                       )
                 ),  

      
         "800_settings_customer_academy_level.admin" => array(
                "title" => "Academy Levels",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_academy_ajax' => array('action' => 'ListLevel')),
                "enabled" => true,
         ),        
    ),


);
