<?php

return array(
    
    "menu"=>array(
        "dashboard_home"=>array(                                    
                     "childs"=>array("dashboard_license"=>''),
       ),
        
     
    ),
    
    "items"=>array(
      
     
       "dashboard_license"=>array(
                    "component"=>"/license_manager/menuItemSettings",   
                    "title"=>"License",
                    "help"=>"license administration",
                    "route_ajax"=>array('license_manager_ajax'=>array('action'=>'Settings')),
                    "credentials"=>array(array('superadmin')),
                    "enabled"=>true,                         
       ), 
        
        
   
  ),
    
 

);