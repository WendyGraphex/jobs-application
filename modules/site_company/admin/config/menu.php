<?php

return array(
            
    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array('8000_company_admin'=>''),                     
                    ),                       
     ),
       
    
    "items"=>array(               
        
        "8000_company_admin"=>array(
                     "title"=>"Company",
                     "icon_awe"=>"fa-building",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_company_ajax'=>array('action'=>'MyCompany')),
                     "enabled"=>true,                                  
                 ),                  
  ),

);