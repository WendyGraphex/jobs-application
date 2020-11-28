<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                                
                                "600_employee_myalerts"=>null,        
                               
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
         
       
        "600_employee_myalerts"=>array(
                     "title"=>"My Alerts", 
                     "mdi"=>"mdi-bell-alert",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_alert_ajax'=>array('action'=>'ListAlert')),
                     "enabled"=>true,                                  
                 ), 
        
        
       
  ),
);