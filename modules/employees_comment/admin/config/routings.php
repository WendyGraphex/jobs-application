<?php


return array(

    "employees_comment_ajax" => array("pattern" => '/module/employees/comment/admin/{action}', 
                               "module" => "employees_comment", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);