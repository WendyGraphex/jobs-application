<?php


return array(

    "employees_notation_ajax" => array("pattern" => '/module/employees/notation/admin/{action}', 
                               "module" => "employees_notation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);