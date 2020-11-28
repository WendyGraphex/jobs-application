<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                          
                                "150_employee_myrequests"=>null,
                                "160_employee_myquotations"=>null,
                            ),                     
                    ),  
        
                     "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                                                        
                                "160_employer_myquotations"=>null,
                                "150_employer_myrequests"=>null,
                            ),                     
                    ),  
     ),
       
    "items"=>array(
                                   
        /* ============================= EMPLOYEE ====================================== */  
           "150_employee_myrequests"=>array(
                     "title"=>"My Requests", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_quotation_ajax'=>array('action'=>'ListRequestForEmployee')),
                     "enabled"=>true,                                  
                 ), 
         
        "160_employee_myquotations"=>array(
                     "title"=>"My offers", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_quotation_ajax'=>array('action'=>'ListQuotationForEmployee')),
                     "enabled"=>true,                                  
                 ), 
       /* ============================= EMPLOYER ====================================== */
          "150_employer_myrequests"=>array(
                     "title"=>"My Requests", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_quotation_ajax'=>array('action'=>'ListRequestForEmployer')),
                     "enabled"=>true,                                  
                 ), 
        "160_employer_myquotations"=>array(
                     "title"=>"My offers", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('sales_quotation_ajax'=>array('action'=>'ListQuotationForEmployer')),
                     "enabled"=>true,                                  
                 ), 
  ),
);