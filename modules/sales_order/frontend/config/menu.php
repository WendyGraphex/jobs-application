<?php


return array(

    "menu"=>array(                   
                 /*   "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                                "700_employee_orders"=>null,                                                            
                            ),                     
                    ),  */
        
         "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                                "070_employer_orders"=>null,                                                            
                            ),                     
                    ),   
     ),
       
    "items"=>array(
                                   
       /*    "700_employee_orders"=>array(
                     "title"=>"My Orders", 
                     "mdi"=>"mdi-home",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_order_ajax'=>array('action'=>'ListOrderForEmployee')),
                     "enabled"=>true,                                  
                 ),  */              
        
           "070_employer_orders"=>array(
                     "title"=>"My Orders", 
                     "mdi"=>"mdi-home",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_order_ajax'=>array('action'=>'ListOrderForEmployer')),
                     "enabled"=>true,                                  
                 ), 
  ),
);