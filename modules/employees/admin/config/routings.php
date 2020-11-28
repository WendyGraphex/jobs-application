<?php


return array(
    
      "employees" => array("pattern" => '/employees/admin/{action}', 
                               "module" => "employees", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),

    "employees_ajax" => array("pattern" => '/module/employees/admin/{action}', 
                               "module" => "employees", 
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
    
      "employees_advert"=>array("pattern"=>'/freelancer/advert/{lang}-{url}-{id}.html',
                            "module"=>"employees",
                            "requirements"=>array("url"=>".*","lang"=>"[a-z][a-z]","id"=>"[0-9]*"),
                            "parameters"=>array('url'=>"{url}","lang"=>"{lang}","id"=>"{id}"),
                            "action"=>"advert",
                            ),
    
      "employees_employee"=>array("pattern"=>'/freelancer/card/{url}.html',
                            "module"=>"employees",
                            "action"=>"employee",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
      "employees_test"=>array("pattern"=>'/employee/test/{action}',
                            "module"=>"employees",
                            "action"=>"test{action}",
                            "requirements"=>array("action"=>".*")),
    
    
       "employees_document_download"=>array("pattern"=>'/freelancers/download/document/{id}/{file}',
                            "module"=>"employees",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "employees_document_download_picture"=>array("pattern"=>'/freelancers/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"employees",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
    
    
    "employees_skill"=>array("pattern"=>'/skill/{skill}',
                            "module"=>"employees",
                            "action"=>"skill", 
                             "parameters"=>array('skill'=>"{skill}"),
                            "requirements"=>array("skill"=>".*")
                         ),
);