<?php


return array(

    "site_currency_ajax" => array("pattern" => '/module/currency/admin/{action}', 
                               "module" => "site_currency", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

);
