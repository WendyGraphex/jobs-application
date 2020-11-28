<?php

return array(
    
  
  "menu"=>array(                   
                    "dashboard"=>array(
                      //  "title"=>"home",
                      //  "route"=>array(""=>""),
                      //  "route_ajax"=>array(""=>""),
                      //  "urlAjax"=>"/module/admin", 
                        "icon"=>"/pictures/icons/home.gif",
                       // "childs"=>array('sites_admin'=>null,'dashboard_home'=>null,'dashboard_settings'=>null),
                    ),  
      
                    "dashboard_home"=>array(
                       "component"=>"/dashboard/menuItemHome",
                       "title"=>"Super Administration",
                       "route"=>array("dashboard_index"=>array()),
                       "route_ajax"=>array("dashboard_ajax"=>array('action'=>'Index')),
                  //   "url"=>"/",
                   //  "enabled"=>true,   
                       "childs"=>array("dashboard_cache"=>null,"dashboard_logs"=>"null"),                 
                   //  "childs"=>array("dashboard_languages"=>'',"dashboard_users"=>'',"dashboard_groups"=>'','dashboard_permissions'=>'',"dashboard_preferences"=>'',"dashboard_cache"=>''),
                      ),
  ),
    
  "items"=>array(
      "dashboard_cache"=>array(    
                    "title"=>"Cache",  
                    "component"=>"/dashboard/menuItemCache",     
                    "route_ajax"=>array('dashboard_ajax'=>array('action'=>'Cache')),
                    "help"=>"cache administration",
                    "credentials"=>array(array('superadmin','admin')),
                    "enabled"=>true,                         
       ), 
        "dashboard_logs"=>array(   
                    "title"=>"Logs",
                    "component"=>"/dashboard/menuItemLogs",     
                    "route_ajax"=>array('dashboard_ajax'=>array('action'=>'ListLog')),
                    "help"=>"cache administration",
                    "credentials"=>array(array('superadmin','admin')),
                    "enabled"=>true,                         
       ), 
  ),
  
);