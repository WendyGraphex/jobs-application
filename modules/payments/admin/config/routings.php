<?php


return array(

    "payments_ajax" => array("pattern" => '/module/payments/admin/{action}', 
                               "module" => "payments", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);