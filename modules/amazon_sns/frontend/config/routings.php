<?php

return array(

   "amazon_sns" => array("pattern" => '/amazon/sns/admin/{action}', 
                               "module" => "amazon_sns", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
    
      "amazon_sns_ajax" => array("pattern" => '/module/amazon/sns/admin/{action}', 
                               "module" => "amazon_sns", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
   
   
);

