<?php


return array(

    "customers_academy_cart_ajax" => array("pattern" => '/module/academy/carts/admin/{action}', 
                               "module" => "customers_academy_cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

);
