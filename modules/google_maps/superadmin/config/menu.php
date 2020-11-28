<?php



return array(
    
    "menu"=>array(                   
        "dashboard_home"=>array(                                            
            "childs"=>array('dashboard_googlemap'=>''),                    
        ),                    
    ),
    
   
   "items"=>array(   // SITE MENU STRUCTURE 
                "site_admin"=>array(              
                     "childs"=>array("site_google_map"=>null),                   
                 ),   
       
                "site_google_map"=>array(
                     "title"=>"Google Map",
                     "route_ajax"=>array('google_maps_ajax'=>array('action'=>'Settings')),
                     "picture"=>"/pictures/icons/googlemap.png",
                     "enabled"=>true,                                
                 ),   
                        
      "dashboard_googlemap"=>array(
            "title"=>"Google Map Accounts",
            "route_ajax"=>array("google_maps_ajax"=>array("action"=>"List")),
            "enabled"=>true,
            "component"=>"/google_maps/menuItemGoogleMapAccounts",           
        ),     
                        
   ),    
    
);