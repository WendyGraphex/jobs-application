<?php


return array(

    "cart_ajax" => array("pattern" => '/module/carts/admin/{action}', 
                               "module" => "cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
    
     "cart_cart" => array("pattern" => '/cart', 
                               "module" => "cart", 
                               "action" => "cart", 
                   ),
);
