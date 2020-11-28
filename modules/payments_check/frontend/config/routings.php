<?php


return array(

    "payments_check_ajax" => array("pattern" => '/module/payments/check/admin/{action}', 
                               "module" => "payments", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);