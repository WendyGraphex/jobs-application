<?php


return array(

      "site_event_cart_ajax" => array("pattern" => '/module/event/carts/admin/{action}', 
                               "module" => "site_event_cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "site_event_cart" => array("pattern" => '/event/carts/admin/{action}', 
                               "module" => "site_event_cart", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
