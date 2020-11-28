<?php

return array(
      
    "customers_course_main"=>array("pattern"=>"/academy",
                               "module"=>"customers_academy",
                               "action"=>"index"),
    
     "customers_course_category"=>array("pattern"=>'/academy/category/{url}',
                           "module" => "customers_academy", 
                               "action" => "category", 
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
       
    "customers_course_categories"=>array("pattern"=>'/academy/categories',
                           "module" => "customers_academy",                        
                           "action" => "categories", 
                           ),
    
   "customers_course"=>array("pattern"=>'/academy/course/{lang}-{url}-{id}.html',
                            "module"=>"customers_academy",
                            "requirements"=>array("url"=>".*","lang"=>"[a-z][a-z]","id"=>"[0-9]*"),
                            "parameters"=>array('url'=>"{url}","lang"=>"{lang}","id"=>"{id}"),
                            "action"=>"course",
                            ), 
    
        "customers_course_contact"=>array("pattern"=>'/academy/contact-us',
                            "module"=>"customers_academy",
                            "action"=>"contactUs",
                            "requirements"=>array("action"=>".*")),
    
    "customers_course_ajax"=>array("pattern"=>'/module/customers/course/admin/{action}',
                            "module"=>"customers_academy",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
    
    
        "customers_course_document_download"=>array("pattern"=>'/academy/course/download/document/{id}/{file}',
                            "module"=>"customers_academy",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "customers_course_document_download_picture"=>array("pattern"=>'/academy/course/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"customers_academy",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
);

