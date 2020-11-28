<?php


return array(

    "customers_academy_cart_ajax" => array("pattern" => '/module/academy/carts/admin/{action}', 
                               "module" => "customers_academy_cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
    
     "customers_academy_cart_cart" => array("pattern" => '/academy/cart', 
                               "module" => "customers_academy_cart", 
                               "action" => "cart", 
                   ),
);
