<?php


return array(

    "employees_messager_ajax" => array("pattern" => '/module/employees/messager/admin/{action}', 
                               "module" => "employees_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "employees_messager" => array("pattern" => '/employees/messager/admin/{action}', 
                               "module" => "employees_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")), 
    
    "employees_messager_test" => array("pattern" => '/employee/messager/test/{action}', 
                               "module" => "employees_messager", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")), 
);