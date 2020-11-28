<?php


return array(

    "projects_documents_ajax" => array("pattern" => '/module/projects/documents/admin/{action}', 
                               "module" => "projects_documents", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
     "projects_documents_download"=>array("pattern"=>'/projects/download/document/{id}/{file}',
                            "module"=>"projects_documents",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "projects_documents_download_picture"=>array("pattern"=>'/projects/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"projects_documents",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ), 

);