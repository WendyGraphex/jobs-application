<?php

return array(    
     "site_cookies"=>array("pattern"=>'/cookies',
                                 "module"=>"site_cookie",
                                 "action"=>"cookies",
                          ),
     "site_cookie_ajax"=>array("pattern"=>'/module/site/cookie/admin/{action}',
                                 "module"=>"site_cookie",
                                 "action"=>"ajax{action}",
                                 "requirements"=>array("action"=>".*")),
  );
