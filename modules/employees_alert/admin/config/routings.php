<?php


return array(

    "employees_alert_ajax" => array("pattern" => '/module/employees/alert/admin/{action}', 
                               "module" => "employees_alert", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);