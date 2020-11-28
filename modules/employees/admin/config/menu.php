<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('3000_employees_admin' => ''),
        ),

    ),

    "items" => array(

        "3000_employees_admin" => array(
            "title" => "Freelancers",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
            "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                '00_employees.accounts.admin' => '',
                '05_employees.galleries.admin' => '',
                "10_employees.adverts.admin" =>'',
           //     "20_employees.requests.admin" =>'',              
              //  "30_employees.alerts.admin" =>'',
                "40_employees.advert.populars.admin" =>'',
                "45_employees.user.populars.admin" =>'',
                "48_employees.category.populars.admin" =>'',
                "50_employees.searches.admin" =>'',                
                "70_employees.sessions.admin" => '',
                "60_employees_contacts_admin" => '',
                '65_employees_claims_admin' => '',  
               // '90_employees.settings.admin' => ''),
                ),
                "enabled" => true,
        ),

        
            "05_employees.galleries.admin" => array(
            "title" => "Galleries",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_ajax' => array('action' => 'ListGallery')),
            "enabled" => true,
                ),
        
        
            "70_employees.sessions.admin"=>array(
                         "title"=>"Connections",
                         "icon_awe" => "fa-users",
                       //  "credentials"=>array(array('superadmin','admin','settings_user')),
                         "route_ajax"=>array('employees_ajax'=>array('action'=>'ListSession')),
                         "enabled"=>true,
                     ), 

            "00_employees.accounts.admin" => array(
            "title" => "Accounts",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_ajax' => array('action' => 'ListEmployee')),
            "enabled" => true,
                ),
        
         "10_employees.adverts.admin" => array(
                "title" => "Jobs",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListAdvert')),
                "enabled" => true,
            ),
        
           "20_employees.requests.admin" => array(
                "title" => "Requests",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListRequest')),
                "enabled" => true,
            ),
        
         /*     "30_employees.alerts.admin" => array(
                "title" => "Alerts",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListAlert')),
                "enabled" => true,
            ),*/
        
"40_employees.advert.populars.admin" => array(
                "title" => "Job Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListPopular')),
                "enabled" => true,
            ),
        
        
        "45_employees.user.populars.admin" => array(
                "title" => "Freelancer Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListEmployeePopular')),
                "enabled" => true,
            ),
        
        "48_employees.category.populars.admin" => array(
                "title" => "Work Category Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListCategoryPopular')),
                "enabled" => true,
            ),
        
          "50_employees.searches.admin" => array(
                "title" => "Searches",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListSearch')),
                "enabled" => true,
            ),
         "60_employees_contacts_admin" => array(
                "title" => "Contacts",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListContact')),
                "enabled" => true,
            ), 
         "65_employees_claims_admin" => array(
                "title" => "Claims",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListClaim')),
                "enabled" => true,
            ), 
        
        
        /* ====================================== S E T T I N G S =============================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                          "300_settings_employees_study_level.admin"=>null,
                          "400_settings_employees_function.admin" =>null,     
                          "450_settings_employees_experience.admin" =>null,    
                          "460_settings_employees_graduate_diploma.admin" =>null,
                          "470_settings_employees_language_level.admin" =>null,
                          "480_settings_employees_skill.admin" =>null,
                       )
                 ),  
        
        
         "300_settings_employees_study_level.admin" => array(
                "title" => "Freelancer Study levels",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListLevel')),
                "enabled" => true,
         ), 
        
         "400_settings_employees_function.admin" => array(
                "title" => "Freelancer Functions",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListFunction')),
                "enabled" => true,
         ), 
        
         "450_settings_employees_experience.admin" =>array(
              "title" => "Freelancer Experiences",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListExperience')),
                "enabled" => true,
         ),   
        
         "460_settings_employees_graduate_diploma.admin" =>array(
              "title" => "Freelancer Graduate Diplomas",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListGraduate')),
                "enabled" => true,
         ),
        
         "470_settings_employees_language_level.admin" =>array(
              "title" => "Freelancer Language Levels",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListLanguageLevel')),
                "enabled" => true,
         ),
        
        "480_settings_employees_skill.admin"  =>array(
              "title" => "Freelancer Skills",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_ajax' => array('action' => 'ListSkill')),
                "enabled" => true,
         ),
    ),


);