<?php


return array(

    "payments_event_user_ajax" => array("pattern" => '/module/payments/event/user/admin/{action}', 
                               "module" => "payments_event_user", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

  
);