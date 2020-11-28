<?php


return array(
    
        "employees_work_refused_request" => array("pattern" => '/employers/work/refused', 
                               "module" => "employees_work", 
                               "action" => "refusedRequestEmployer}", 
                               "requirements" => array("action" => ".*")),

    "employees_work_ajax" => array("pattern" => '/module/employees/works/admin/{action}', 
                               "module" => "employees_work", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "employees_work_test" => array("pattern" => '/employees/work/test/{action}', 
                               "module" => "employees_work", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")),

);