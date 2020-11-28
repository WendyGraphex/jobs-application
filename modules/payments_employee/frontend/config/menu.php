<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                              
                                 "750_employee_mypayments"=>null,                              
                                 "800_employee_method_payments"=>null,    
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
           "750_employee_mypayments"=>array(
                     "title"=>"My Payments", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('payments_employee_ajax'=>array('action'=>'ListPaymentForEmployee')),
                     "enabled"=>true,                                  
                 ),                
        
         "800_employee_method_payments"=>array(
                     "title"=>"Payment methods", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('payments_employee_ajax'=>array('action'=>'Method')),
                     "enabled"=>true,                                  
                 ),                
        
        /* =================== PAYMENT =============================== */
        
         "7000_payments_admin" => array(          
            "childs" => array(
                  '85_payments_employee_method_admin' => null,                 
                ),            
        ),           
        
         "85_payments_employee_method_admin" =>array(
              "title" => "Payment Employee Methods",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('payments_employee_ajax' => array('action' => 'ListEmployeeMethod')),
            "enabled" => true,
         ),
  ),
);