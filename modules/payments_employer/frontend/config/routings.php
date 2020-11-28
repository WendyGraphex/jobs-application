<?php


return array(

   
    "payments_employer_test" => array("pattern" => '/payments/employer/test/{action}', 
                               "module" => "payments_employer", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")),
);