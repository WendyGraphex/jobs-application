<?php


return array(

    "employees_filemanager_ajax" => array("pattern" => '/module/employees/filemanager/admin/{action}', 
                               "module" => "employees_filemanager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
    
);