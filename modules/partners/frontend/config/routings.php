<?php


return array(

      "partners_ajax" => array("pattern" => '/module/partners/admin/{action}', 
                               "module" => "partners", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
    "partners_category"=>array("pattern"=>'/category/{url}',
                           "module" => "partners", 
                               "action" => "category", 
                            "parameters"=>array('url'=>"/{url}"),
                            "requirements"=>array("url"=>".*")),
    
       
    "partners_categories"=>array("pattern"=>'/categories',
                           "module" => "partners",                        
                           "action" => "categoriesEmployer", 
                           ),
    
    "partners_categories_employer"=>array("pattern"=>'/categories/employer',                                                      
                            "module" => "partners", 
                            "action" => "categoriesEmployer", 
                           ),
    
     "partners_categories_employee"=>array("pattern"=>'/categories/employee',                                                      
                            "module" => "partners", 
                            "action" => "categoriesEmployee", 
                           ),
);
