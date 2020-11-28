<?php


return array(

    "payments_employer_ajax" => array("pattern" => '/module/payments/employer/admin/{action}', 
                               "module" => "payments_employer", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    "payments_employer_test" => array("pattern" => '/payments/employer/test/{action}', 
                               "module" => "payments_employer", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")),
);