<?php


return array(

    "menu"=>array(                   
                    "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                                 "650_employer_project_manager"=>null,
                              
                               
                              
                            ),                     
                    ), 
        
        
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                                 "650_employee_project_manager"=>null,
                              
                               
                              
                            ),                     
                    ), 
     ),
       
    "items"=>array(
                                   
           "650_employer_project_manager"=>array(
                     "title"=>"Project Manager", 
                     "mdi"=>"mdi-home",
                   //  "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('projects_ajax'=>array('action'=>'ListProjectForEmployer')),
                     "enabled"=>true,                                  
                 ),
        
        
         "650_employee_project_manager"=>array(
                     "title"=>"Project Manager", 
                     "mdi"=>"mdi-home",
                   //  "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('projects_ajax'=>array('action'=>'ListProjectForEmployee')),
                     "enabled"=>true,                                  
                 ),
         
        
  ),
);