<?php


return array(

    "employers_ajax" => array("pattern" => '/module/employers/admin/{action}', 
                               "module" => "employers", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    // "customers_restrictive_access_file" => array(
    //     "pattern" => '/restrictive/data/customers/users/{user}/{file}',
    //     "requirements" => array("user" => "[0-9]*",
    //         "file" => ".*",
    //     ),
    //     "module" => "customers",
    //     "action" => "restrictiveAccessFile",
    //     "parameters" => array("file" => "{file}", "customer_user" => "{user}")
    // )
    
    
       "employers_advert"=>array("pattern"=>'/employer/advert/{lang}-{url}-{id}.html',
                            "module"=>"employers",
                            "requirements"=>array("url"=>".*","lang"=>"[a-z][a-z]","id"=>"[0-9]*"),
                            "parameters"=>array('url'=>"{url}","lang"=>"{lang}","id"=>"{id}"),
                            "action"=>"advert",
                            ),
    
       "employers_employer"=>array("pattern"=>'/employer/card/{url}.html',
                            "module"=>"employers",
                            "action"=>"employer",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
    "employers_company"=>array("pattern"=>'/employer/company/graphex/{url}-{id}.html',
                            "module"=>"employers",
                            "action"=>"company",
                            "parameters"=>array('url'=>"{url}","id"=>"{id}"),
                            "requirements"=>array("url"=>".*","id"=>"[0-9]*")),
    
       "employers_test"=>array("pattern"=>'/employer/test/{action}',
                            "module"=>"employers",
                            "action"=>"test{action}",
                            "requirements"=>array("action"=>".*")),
    
     "employers_document_download"=>array("pattern"=>'/employers/download/document/{id}/{file}',
                            "module"=>"employers",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "employers_document_download_picture"=>array("pattern"=>'/employers/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"employers",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
);