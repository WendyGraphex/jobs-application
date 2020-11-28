<?php


return array(

    "employees_messager_ajax" => array("pattern" => '/module/employees/messager/admin/{action}', 
                               "module" => "employees_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "employees_messager_download"=>array("pattern"=>'/employees/messages/{id}/files/{file}',
        "module"=>"employees_messager",
        "action"=>"download",
        "requirements" => array(         
            "file" => ".*",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","id"=>"{id}")
     ),
    
    
    "employees_messager_pictures_download"=>array("pattern"=>'/employees/messages/{id}/pictures/{type}/{file}',
        "module"=>"employees_messager",
        "action"=>"downloadPictures",
        "requirements" => array(         
            "file" => ".*",
            "type" => "thumb|medium",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","type"=>"{type}","id"=>"{id}")
     ),
);