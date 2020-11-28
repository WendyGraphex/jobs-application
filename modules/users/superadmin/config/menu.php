<?php

return array(
    
    "menu"=>array(
        "dashboard_home"=>array(                                    
                     "childs"=>array("dashboard_users"=>''),
       ),
        
        "site.dashboard"=>array(                                            
                        "childs"=>array('site_users'=>''),                    
                    ),  
    ),
    
    "items"=>array(
      
     
       "dashboard_users"=>array(
                    "component"=>"/users/menuItemUsers",   
                    "title"=>"Users",
                    "help"=>"users administration",
                    "route_ajax"=>array('users_dashboard_ajax'=>array('action'=>'DashboardList')),
                    "credentials"=>array(array('superadmin','admin')),
                    "enabled"=>true,                         
       ), 
        
        "site_users"=>array(
                     "title"=>"Users Administration",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Home')),
                     "enabled"=>true,
                     "childs"=>array('site.users.admin'=>'','site.functions.admin'=>'',"site.team.admin"=>'',
                                     'site.attributions.admin'=>'',"site.user.settings"=>''
                                    ),                    
                 ),   
        
        "site.users.admin"=>array(
                    "title"=>"Users",
                    "route_ajax"=>array("users_site_ajax"=>array("action"=>"List")),                  
                    "picture"=>"/pictures/icons/users.png",
                    "help"=>"modify, add and delete users",                 
                    ),  
               
        
          "site.user.settings"=>array(
                         "title"=>"Settings",
                         "route_ajax"=>array("users_site_ajax"=>array("action"=>"Settings")),                  
                         "picture"=>"/pictures/icons/settings.png",
                         "help"=>"modify, add and delete status",                 
                         ), 
   
  ),
    
 

);