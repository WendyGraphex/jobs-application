<?php


return array(

    "projects_ajax" => array("pattern" => '/module/projects/manager/admin/{action}', 
                               "module" => "projects", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);