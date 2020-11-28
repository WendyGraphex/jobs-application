<?php

return array(
  
    "cms_pages_ajax"=>array("pattern"=>'/module/site/cms/page/{action}',"module"=>"cms_pages","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
  
    
     "cms_pages"=>array("pattern"=>'/cms/{page}',
                       "requirements"=>array("url"=>".*","extension"=>"htm|html","page"=>"({url}.{extension})?"),
                       "module"=>"cms_pages",
                       "action"=>"PageView",
                       "defaults"=>array("url"=>"index","page"=>""),
                       "parameters"=>array("url"=>"{url}")
                      ),
    
);

