<?php


return array(

    "menu"=>array(                   
              
        
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                                 "660_employee_filemanager"=>null,
                              
                               
                              
                            ),                     
                    ), 
     ),
       
    "items"=>array(
                                   
         
         "660_employee_myprojects"=>array(
                     "title"=>"My Projects", 
                     "mdi"=>"mdi-home",
                   //  "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_filemanager_ajax'=>array('action'=>'ListPortfolio')),
                     "enabled"=>true,                                  
                 ),
         
        
  ),
);