<?php


return array(

      "sales_billing_ajax" => array("pattern" => '/module/billings/admin/{action}', 
                               "module" => "sales_billing", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "sales_billing" => array("pattern" => '/billings/admin/{action}', 
                               "module" => "sales_billing", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
