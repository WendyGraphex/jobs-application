<?php


return array(

    "customers_blog_ajax" => array("pattern" => '/module/customers/blog/admin/{action}', 
                               "module" => "customers_blog", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "customers_blog_article"=>array("pattern"=>'/blog/article/{url}',
                            "module"=>"customers_blog",
                            "action"=>"article", 
                             "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")
                         ),
    
    
     "customers_blog_activity"=>array("pattern"=>'/blog/activity/{url}.html',
                           // "module"=>"products",
                           // "action"=>"category",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
    
    
);
