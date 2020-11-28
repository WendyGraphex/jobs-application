<?php


return array(

      "sales_order_ajax" => array("pattern" => '/module/orders/admin/{action}', 
                               "module" => "sales_order", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "sales_order" => array("pattern" => '/orders/admin/{action}', 
                               "module" => "sales_order", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
