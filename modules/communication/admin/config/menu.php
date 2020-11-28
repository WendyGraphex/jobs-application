<?php


return array(

    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "8500_communication_admin"=>null,                             
                              ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
         "8500_communication_admin"=>array(
                     "title"=>"Communications", 
                     "icon_awe"=>"fa-cubes",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                      "route_ajax"=>array('site_ajax'=>array('action'=>'Home')),
                     "enabled"=>true,                                  
                 ),  
        
             
  ),
);