<?php


return array(
    
    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "7200_site_warning_admin"=>null,
                              ),                     
                    ),                       
     ),
    
    
   "items"=>array(      
               "7200_site_warning_admin"=>array(
                     "title"=>"Warning", 
                     "icon_awe"=>"fa-question-circle",
                   // "credentials"=>array(array('superadmin','admin','settings_user')),
                    "route_ajax"=>array('site_warning_ajax'=>array('action'=>'ListWarning')),
                    
                     "enabled"=>true,  
               ),             
               
                                
        
   ),      
);