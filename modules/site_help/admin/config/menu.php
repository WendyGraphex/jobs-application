<?php


return array(
    
    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "7200_site_help_admin"=>null,
                              ),                     
                    ),                       
     ),
    
    
   "items"=>array(      
               "7200_site_help_admin"=>array(
                     "title"=>"Help", 
                     "icon_awe"=>"fa-question-circle",
                   // "credentials"=>array(array('superadmin','admin','settings_user')),
                    "route_ajax"=>array('site_help_ajax'=>array('action'=>'ListHelp')),
                    
                     "enabled"=>true,  
               ),             
               
                                
        
   ),      
);