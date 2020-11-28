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
    
     "employers_project_project"=>array("pattern"=>'/employer/project/name/{url}',
                            "module"=>"employers_project",
                            "action"=>"project",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
     "employers_project_reference"=>array("pattern"=>'/employer/project/reference/{reference}',
                            "module"=>"employers_project",
                            "action"=>"project",
                            "parameters"=>array('reference'=>"{reference}"),
                            "requirements"=>array("reference"=>".*")),
    
     "employers_project_document_download"=>array("pattern"=>'/employer/projects/document/{id}/{file}',
                            "module"=>"employers_project",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "employers_project_document_download_picture"=>array("pattern"=>'/employer/projects/document/pictures/{id}/{type}/{file}',
                            "module"=>"employers_project",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
);