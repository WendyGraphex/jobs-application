<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                                
                                "680_employee_myportfolio"=>null,
                      ),
                 ),
   ),
        
                                        
     "items"=>array(
                                   
           "680_employee_myportfolio"=>array(
                     "title"=>"My Portfolio", 
                     "mdi"=>"mdi-home",
                     
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                   "route_ajax"=>array('employees_portfolio_ajax'=>array('action'=>'List')),
                     "enabled"=>true,                                  
                 ),                
        
    ),       
);