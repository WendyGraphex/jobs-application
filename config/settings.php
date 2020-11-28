<?php

// environnement => data
return array(
    
    "default"=>array(
                       "error_404_module"=>"default", //   # To be called when a 404 error is raised
                       "error_404_action"=>"error404", //  # Or when the requested URL doesn't match any route
                       "error_404_file_module"=>"default", 
                       "error_404_file_action"=>"error404file", 
                       "login_module"=>"default",
                       "login_action"=>"login",
                       "default_site_not_available_module"=>"default",
                       "default_site_not_available_action"=>"siteNotAvailable",
                       "site_not_available_module"=>"default",
                       "site_not_available_action"=>"siteNotAvailable",
                    ),
    "dev"=>array("debug_mysql"=>true,"info_mysql"=>true),
    
    "prod"=>array("debug_mysql"=>false), // To delete when site OK
    
    "all"=>array(
             "i18n"=>true,
           
    ),
    
);