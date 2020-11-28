<?php

return array(
    "cms_pages"=>array("pattern"=>'/cms/{page}',
                       "requirements"=>array("url"=>".*","extension"=>"htm|html","page"=>"({url}.{extension})?"),
                       "module"=>"cms_pages",
                       "action"=>"PageView",
                       "defaults"=>array("url"=>"index","page"=>""),
                       "parameters"=>array("url"=>"{url}")
                      ),
    
);
/*
return array(
//ok    "cms_pages"=>array("pattern"=>'#^/cms/(.*).(htm|html)$#',"module"=>"cms_pages","action"=>"cmsPageView","parameters"=>array("url"=>"\\1")),
//ok    "cms_pages_root"=>array("pattern"=>'#^/cms/$#',"module"=>"cms_pages","action"=>"cmsPageView","parameters"=>array("url"=>"index")),
  );
 */

