<?php


return array(

    "employers_alert_ajax" => array("pattern" => '/module/employers/alert/admin/{action}', 
                               "module" => "employers_alert", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);