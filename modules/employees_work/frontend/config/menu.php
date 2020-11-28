<?php


return array(

    "menu"=>array(                   
                     
        
        
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                                 "650_employee_work_manager"=>null,
                              
                               
                              
                            ),                     
                    ), 
        
                      "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                              
                                "700_employee_work_mypayment_requests"=>null,                              
                             
                            ),                     
                    ),   
     ),
       
    "items"=>array(
                                   
           "650_employee_work_manager"=>array(
                     "title"=>"My works", 
                     "mdi"=>"mdi-home",
                   //  "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_work_ajax'=>array('action'=>'ListWork')),
                     "enabled"=>true,                                  
                 ),
        
        
          "700_employee_work_mypayment_requests"=>array(
                     "title"=>"My Payment advises", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_work_ajax'=>array('action'=>'ListRequestForEmployee')),
                     "enabled"=>true,                                  
                 ),
         
        
  ),
);