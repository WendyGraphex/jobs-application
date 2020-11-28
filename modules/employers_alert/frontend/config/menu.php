<?php


return array(

    "menu"=>array(                   
                    "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                                
                                "600_employer_myalerts"=>null,        
                               
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
         
       
        "600_employer_myalerts"=>array(
                     "title"=>"My Alerts", 
                     "mdi"=>"mdi-bell-alert",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_alert_ajax'=>array('action'=>'ListAlert')),
                     "enabled"=>true,                                  
                 ), 
        
        
       
  ),
);