<?php


return array(

    "customers_ajax" => array("pattern" => '/module/customers/admin/{action}', 
                               "module" => "customers", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);