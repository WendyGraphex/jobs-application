<?php


return array(

      "site_event_order_ajax" => array("pattern" => '/module/event/orders/admin/{action}', 
                               "module" => "site_event_order", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "site_event_order" => array("pattern" => '/event/orders/admin/{action}', 
                               "module" => "site_event_order", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
