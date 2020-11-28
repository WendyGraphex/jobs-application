<?php


return array(

      "sales_quotation_ajax" => array("pattern" => '/module/quotations/admin/{action}', 
                               "module" => "sales_quotation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
        "sales_quotation_employer_test"=>array("pattern"=>'/quotations/employer/test/{action}',
                            "module"=>"sales_quotation",
                            "action"=>"testEmployer{action}",
                            "requirements"=>array("action"=>".*")),
    
        "sales_quotation_employee_test"=>array("pattern"=>'/quotations/employee/test/{action}',
                            "module"=>"sales_quotation",
                            "action"=>"testEmployee{action}",
                            "requirements"=>array("action"=>".*")),
    
    "sales_quotation_employee" => array("pattern" => '/quotations/freelancer/admin/{action}', 
                               "module" => "sales_quotation", 
                               "action" => "{action}Employee", 
                               "requirements" => array("action" => ".*")),
);
