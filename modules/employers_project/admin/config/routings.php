<?php


return array(

    "employers_project_ajax" => array("pattern" => '/module/employers/projects/admin/{action}', 
                               "module" => "employers_project", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
    
     "employers_project_admin" => array("pattern" => '/employers/projects/admin/{action}', 
                               "module" => "employers_project", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")), 
    
     "employers_project"=>array("pattern"=>'/employer/project/{url}',
                            "module"=>"employers_project",
                            "action"=>"project",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
);