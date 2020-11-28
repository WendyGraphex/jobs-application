<?php

return array(
    
  "menu"=>array(                   
                    "site.dashboard"=>array(                                          
                        "childs"=>array('site_admin'=>'','site_products'=>'','site_customers'),                     
                    ),
       "dashboard_home"=>array(                                    
                     "childs"=>array("dashboard_database_server"=>null,
                                     'dashboard_phpinfo'=>'',
                                    // 'dashboard_emailer'=>''
                                ),
       ),
                       
   ),
    
   "items"=>array(   // SITE MENU STRUCTURE 
                "site_admin"=>array(
                     "title"=>"site administration",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Home')),
                     "icon"=>"/pictures/icons/web.png",
                     "enabled"=>true,
                     "childs"=>array("site_logs"=>null,"site_cache"=>null),                   
                 ),   
                        
                "site_products"=>array(
                     "title"=>"Products Administration",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Home')),
                     "enabled"=>true,
                     "childs"=>array('site.products.admin'=>''),                    
                 ), 
       
                 "site_cache"=>array(
                     "title"=>"Cache",
                     "picture"=>"/pictures/icons/cache.png",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Cache')),
                     "enabled"=>true,                               
                 ), 
       
                "site_logs"=>array(
                     "title"=>"Logs",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'ListLog')),
                     "enabled"=>true,
                     "childs"=>array(),                                                        
                     "picture"=>"/pictures/icons/log.png",
                     "help"=>"modify, add and delete status",  
                 ),  
                    
                 'dashboard_phpinfo'=>array(
                     "title"=>"PHP Info",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'PhpInfo')),
                     "enabled"=>true,                                                                        
                     "picture"=>"/pictures/icons/log.png",
                     "help"=>"modify, add and delete status",  
                 ),
            /*     "dashboard_database_server"=>array(
                     "title"=>"Database server administration",
                     "route_ajax"=>array('site_ajax'=>array('action'=>'MySqlServer')),
                     "component"=>"/site/menuDatabaseServerItem",
                     "picture"=>"/pictures/icons/web.png",
                     "enabled"=>true,
                     "credentials"=>array(),                  
                 ),  */
       
            'dashboard_phpinfo'=>array(                    
                    "component"=>"/site/menuItemPhpInfo",   
                     "route_ajax"=>array('site_ajax'=>array('action'=>'PhpInfo')),
                     "enabled"=>true,                                                                                            
                 ),
       
            'dashboard_emailer'=>array(                     
                     "title"=>"Emailer",
                     "component"=>"/site/menuItemEmailer",   
                     "route_ajax"=>array('site_ajax'=>array('action'=>'Emailer')),
                     "enabled"=>true,                                                                                          
                 ),
   ),    
     
);