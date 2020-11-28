<?php


return array(

    "payments_check_ajax" => array("pattern" => '/module/payments/check/admin/{action}', 
                               "module" => "payments_check", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);