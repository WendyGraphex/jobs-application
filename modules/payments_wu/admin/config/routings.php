<?php


return array(

    "payments_wu_ajax" => array("pattern" => '/module/payments/western-union/admin/{action}', 
                               "module" => "payments_wu", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);