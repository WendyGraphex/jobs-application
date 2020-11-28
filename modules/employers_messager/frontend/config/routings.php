<?php


return array(

    "employers_messager_ajax" => array("pattern" => '/module/employers/messager/admin/{action}', 
                               "module" => "employers_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

 "employers_messager_download"=>array("pattern"=>'/employers/messages/{id}/files/{file}',
        "module"=>"employers_messager",
        "action"=>"download",
        "requirements" => array(         
            "file" => ".*",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","id"=>"{id}")
     ),
    
    
    "employers_messager_pictures_download"=>array("pattern"=>'/employers/messages/{id}/pictures/{type}/{file}',
        "module"=>"employers_messager",
        "action"=>"downloadPictures",
        "requirements" => array(         
            "file" => ".*",
            "type" => "thumb|medium",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","type"=>"{type}","id"=>"{id}")
     ),
);