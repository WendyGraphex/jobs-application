<?php


return array(

    "payments_withdrawal_ajax" => array("pattern" => '/module/payments/withdrawal/admin/{action}', 
                               "module" => "payments_withdrawal", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);