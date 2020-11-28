<?php


return array(

    
    "payments_event_user_ajax" => array("pattern" => '/payments/events/user/{action}', 
                               "module" => "payments_event_user", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")), 
);