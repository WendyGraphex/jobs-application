<?php

return array(

  
    
    "customers_blog_main"=>array("pattern"=>"/blog",
                               "module"=>"customers_blog",
                               "action"=>"articles"),
    
     "customers_blog_articles"=>array("pattern"=>'/blog/articles',
                            "module"=>"customers_blog",
                            "action"=>"articles"
                         ), 
    "customers_blog_article"=>array("pattern"=>'/blog/article/{url}.html',
                            "module"=>"customers_blog",
                            "action"=>"article", 
                             "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")
                         ), 
    
    "customers_blog_activity"=>array("pattern"=>'/blog/activity/{url}',
                            "module"=>"customers_blog",
                             "action"=>"activity",
                            "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")),
    
    "customers_blog_activities"=>array("pattern"=>'/blog/activities',
                             "module"=>"customers_blog",
                              "action"=>"activities",
                             ),
    
    
    
      "customers_blog_ajax" => array("pattern" => '/module/blog/admin/{action}', 
                               "module" => "customers_blog", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),
   
   
   
);

