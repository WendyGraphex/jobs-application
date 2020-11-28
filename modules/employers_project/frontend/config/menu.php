<?php


return array(

    "menu"=>array(                   
                    "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                                 "700_employer_myprojects"=>null,
                              
                   ),
               ),
     ),
       
    "items"=>array(
                                   
           "700_employer_myprojects"=>array(
                     "title"=>"My Projects", 
                     "mdi"=>"mdi-home",
                   //  "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_project_ajax'=>array('action'=>'ListProject')),
                     "enabled"=>true,                                  
                 ),
        
        
        
        
  ),
);