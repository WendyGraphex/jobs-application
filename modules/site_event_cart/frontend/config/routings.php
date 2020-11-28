<?php


return array(
    
     "site_event_cart" => array("pattern" => '/events/carts/admin/{action}', 
                               "module" => "site_event_cart", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),

    "site_event_cart_ajax" => array("pattern" => '/module/events/carts/admin/{action}', 
                               "module" => "site_event_cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
    
     "site_event_cart_cart" => array("pattern" => '/events/cart', 
                               "module" => "site_event_cart", 
                               "action" => "cart", 
                   ),
);
