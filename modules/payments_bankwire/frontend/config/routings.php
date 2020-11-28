<?php


return array(

    "payments_bankwire_ajax" => array("pattern" => '/module/payments/bankwire/admin/{action}', 
                               "module" => "payments", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);