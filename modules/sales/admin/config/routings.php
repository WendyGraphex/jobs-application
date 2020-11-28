<?php


return array(

      "sales_ajax" => array("pattern" => '/module/sales/admin/{action}', 
                               "module" => "sales", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "sales" => array("pattern" => '/sales/admin/{action}', 
                               "module" => "sales", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
