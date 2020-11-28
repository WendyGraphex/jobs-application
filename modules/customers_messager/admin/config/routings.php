<?php


return array(

    "customers_messager_ajax" => array("pattern" => '/module/customers/messager/admin/{action}', 
                               "module" => "customers_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "customers_messager_download"=>array("pattern"=>'/customers/messages/{id}/files/{file}',
        "module"=>"customers_messager",
        "action"=>"download",
        "requirements" => array(         
            "file" => ".*",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","id"=>"{id}")
     ),
    
    
    "customers_messager_pictures_download"=>array("pattern"=>'/customers/messages/{id}/pictures/{type}/{file}',
        "module"=>"customers_messager",
        "action"=>"downloadPictures",
        "requirements" => array(         
            "file" => ".*",
            "type" => "thumb|medium",
            "id" => "[0-9]*",
        ),
         "parameters" => array("file"=>"{file}","type"=>"{type}","id"=>"{id}")
     ),
);
