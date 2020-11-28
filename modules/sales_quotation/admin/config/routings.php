<?php


return array(

      "sales_quotation_ajax" => array("pattern" => '/module/quotations/admin/{action}', 
                               "module" => "sales_quotation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
      "sales_quotation" => array("pattern" => '/quotations/admin/{action}', 
                               "module" => "sales_quotation", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
);
