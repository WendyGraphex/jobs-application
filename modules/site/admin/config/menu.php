<?php


return array(

    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "6000_site_admin"=>null,                             
                                "9000_system_admin"=>null),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
         "9000_system_admin"=>array(
                     "title"=>"System", 
                     "icon_awe"=>"fa-cubes",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_ajax'=>array('action'=>'System')),
                     "enabled"=>true,                                  
                 ),  
        
            "6000_site_admin"=>array(
                     "title"=>"Site", 
                     "icon_awe"=>"fa-globe",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                   //  "route_ajax"=>array('site_ajax'=>array('action'=>'System')),
                     "enabled"=>true,                                  
                 ),  
        
        "9999_dashboard_settings_admin"=>array(
                     "childs"=>array(
                            "990_site_emails_settings"=>'',
                     //    "995_site_limits_settings"=>'',
                            '999_site_settings'=>'',
                                    )
                 ),  
        
         "999_site_settings"=>array(
                     "title"=>"Settings", 
                     "icon_awe"=>"fa-cog",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Settings')),
                     "enabled"=>true,                                  
                 ),  
        
        "990_site_emails_settings"=>array(
                     "title"=>"Emails", 
                     "icon_awe"=>"fa-cog",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_ajax'=>array('action'=>'EmailSettings')),
                     "enabled"=>true,                                  
                 ),  
        
        "995_site_limits_settings"=>array(
                     "title"=>"Limits", 
                     "icon_awe"=>"fa-cog",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_ajax'=>array('action'=>'LimitSettings')),
                     "enabled"=>true,                                  
                 ),  
  ),
);