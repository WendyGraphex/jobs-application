<?php


return array(

    "payments_paypal_ajax" => array("pattern" => '/module/payments/paypal/admin/{action}', 
                               "module" => "payments_paypal", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    "payments_paypal" => array("pattern" => '/payments/paypal/admin/{action}', 
                               "module" => "payments_paypal", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),

    
);