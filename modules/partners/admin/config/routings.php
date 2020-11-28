<?php


return array(

     "partners" => array("pattern" => '/partners/admin/{action}', 
                               "module" => "partners", 
                               "action" => "{action}", 
                               "requirements" => array("action" => ".*")),
    
      "partners_ajax" => array("pattern" => '/module/partners/admin/{action}', 
                               "module" => "partners", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
    "partners_category"=>array("pattern"=>'/category/{url}',
                           // "module"=>"products",
                           // "action"=>"category",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
);
