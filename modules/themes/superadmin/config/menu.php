<?php

return array(
  "items"=>array(   
       "dashboard_superadmin"=>array(                  
                      "childs"=>array("dashboard_themes"=>''),
                 ),
        
        "dashboard_themes"=>array(
                    "title"=>"themes",
                    "url"=>"/sites/themes",
                    "help"=>"themes",
                    "picture"=>"/pictures/icons/theme.png",
                    "credentials"=>array(),
                    "enabled"=>true,
                    "module"=>"site"
                    ), 
      
       "site_admin"=>array(                 
                     "childs"=>array("site_themes_admin"=>''),
                 ), 
      
       "site_themes_admin"=>array(
                    "title"=>"theme manager",                  
                    "url"=>"/themes/Admin",     
                    "urlAjax"=>"/module/site/themes/admin/ListTheme",     
                    "picture"=>"/pictures/icons/theme.png",
                    "help"=>"themes administration",
                    "credentials"=>array(),
                    "enabled"=>true,
                    "module"=>"themes",
                    ),    
      
      
   ),   
      
);