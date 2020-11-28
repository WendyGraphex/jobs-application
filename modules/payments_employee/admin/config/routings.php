<?php


return array(

    "payments_employee_ajax" => array("pattern" => '/module/payments/employees/admin/{action}', 
                               "module" => "payments_employee", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "payments_employee_test" => array("pattern" => '/payments/employee/test/{action}', 
                               "module" => "payments_employee", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")),
);