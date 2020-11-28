<?php


return array(

    "employees_contact_ajax" => array("pattern" => '/module/employees/contact/admin/{action}', 
                               "module" => "employees_contact", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);