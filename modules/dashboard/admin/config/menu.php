<?php

return array(

  "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(                           
                               "0000_dashboard_admin"=>null,
                               "9999_dashboard_settings_admin"=>null,
                            ),                     
                    ),                       
     ),
    
    
     "items"=>array(
                           
        
        "0000_dashboard_admin"=>array(
                     "title"=>"Dashboard", 
                     "icon_awe"=>"fa-home",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route"=>array('index'=>array()),
                     "route_ajax"=>array('dashboard_ajax'=>array('action'=>'Dashboard')),
                     "enabled"=>true,                                  
                 ),  
         
          "9999_dashboard_settings_admin"=>array(
                     "title"=>"Settings", 
                     "icon_awe"=>"fa-cog",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route"=>array('index'=>array()),
                     "route_ajax"=>array('dashboard_ajax'=>array('action'=>'ListSettings')),
                     "enabled"=>true,                                  
                 ),  
  ),
);

