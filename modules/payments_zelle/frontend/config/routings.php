<?php


return array(

    "payments_zelle_ajax" => array("pattern" => '/module/payments/zelle/admin/{action}', 
                               "module" => "payments_zelle", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);