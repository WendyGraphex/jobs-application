<?php


return array(

    "customers_registration_ajax" => array("pattern" => '/module/customers/registration/admin/{action}', 
                               "module" => "customers_registration", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "customers_registration" => array("pattern" => '/customers/registration/admin/{action}', 
                               "module" => "customers_registration", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
