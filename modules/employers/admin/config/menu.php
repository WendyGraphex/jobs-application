<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('5000_employers_admin' => ''),
        ),

    ),

    "items" => array(

        "5000_employers_admin" => array(
            "title" => "Employers",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
            "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                '10_employers.companies.admin' => '', 
                '00_employers.accounts.admin' => '',
                '20_employers.galleries.admin' => '', 
               // '25_employers.cities.admin' => '',  
                "28_employers.adverts.admin" =>'',
              //  "30_employers.requests.admin" =>'',
            //    "35_employers.alerts.admin" =>'',
                "40_employers.avderts.populars.admin" =>'',
                "42_employers.companies.populars.admin" =>'',
                "44_employers.category.populars.admin" =>'',
                "45_employers.users.populars.admin" =>'',
                "50_employers.searches.admin" =>'',
                "60_employers.contacts.admin" =>'',   
                "65_employers_claims_admin" => '',
                "70_employers.sessions.admin" => '',
             //   '90_employers.settings.admin' => ''),
                ),
                "enabled" => true,
        ),

             "10_employers.companies.admin" => array(
            "title" => "Companies",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employers_ajax' => array('action' => 'ListCompany')),
            "enabled" => true,
                ),
        
                 "20_employers.galleries.admin" => array(
            "title" => "Galleries",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employers_ajax' => array('action' => 'ListGallery')),
            "enabled" => true,
                ),
        
          "25_employers.cities.admin" => array(
                "title" => "Galleries Cities",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListCity')),
                "enabled" => true,
            ),
        
           "28_employers.adverts.admin" => array(
                "title" => "Jobs",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListAdvert')),
                "enabled" => true,
            ),
        
       /*   "30_employers.requests.admin" => array(
                "title" => "Requests",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListRequest')),
                "enabled" => true,
            ),*/
        
       /*       "35_employers.alerts.admin" => array(
                "title" => "Alerts",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListAlert')),
                "enabled" => true,
            ),*/
        
         "40_employers.avderts.populars.admin" => array(
                "title" => "Job Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListPopular')),
                "enabled" => true,
            ),
        
           "44_employers.category.populars.admin" => array(
                "title" => "Work Category Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListCategoryPopular')),
                "enabled" => true,
            ),
        
        "45_employers.users.populars.admin" => array(
                "title" => "Employer Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListEmployerPopular')),
                "enabled" => true,
            ),
        
          "42_employers.companies.populars.admin" => array(
                "title" => "Company Populars",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListCompanyPopular')),
                "enabled" => true,
            ),
        
          "50_employers.searches.admin" => array(
                "title" => "Searches",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListSearch')),
                "enabled" => true,
            ),
        
                "60_employers.contacts.admin"=>array(
                         "title"=>"Contacts",
                         "icon_awe" => "fa-users",
                       //  "credentials"=>array(array('superadmin','admin','settings_user')),
                         "route_ajax"=>array('employers_ajax'=>array('action'=>'ListContact')),
                         "enabled"=>true,
                     ), 
        
          "65_employers_claims_admin" => array(
                "title" => "Claims",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListClaim')),
                "enabled" => true,
            ), 
            "70_employers.sessions.admin"=>array(
                         "title"=>"Connections",
                         "icon_awe" => "fa-users",
                       //  "credentials"=>array(array('superadmin','admin','settings_user')),
                         "route_ajax"=>array('employers_ajax'=>array('action'=>'ListSession')),
                         "enabled"=>true,
                     ), 

            "00_employers.accounts.admin" => array(
            "title" => "Accounts",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employers_ajax' => array('action' => 'ListEmployer')),
            "enabled" => true,
                ),

        
        /* ====================================== S E T T I N G S =============================================== */
        
           "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(                        
                          "300_settings_employers_functions.admin"=>null,                    
                          "400_settings_employers_language_level.admin" =>null,   
                            "010_settings_employers_activity.admin"=>"",    
                       )
                 ),  

      
         "300_settings_employers_functions.admin" => array(
                "title" => "Employer functions",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListFunction')),
                "enabled" => true,
         ),              
        
         "400_settings_employers_language_level.admin" =>array(
              "title" => "Employer Language Levels",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListLanguageLevel')),
                "enabled" => true,
         ), 
        
         "010_settings_employers_activity.admin" => array(
                "title" => "Employer Activities",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_ajax' => array('action' => 'ListActivity')),
                "enabled" => true,
         ), 
       
    ),


);