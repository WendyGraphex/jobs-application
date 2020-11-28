<?php

return array(    
     "site_cookie_ajax"=>array("pattern"=>'/module/site/cookie/admin/{action}',
                                 "module"=>"site_cookie",
                                 "action"=>"ajax{action}",
                                 "requirements"=>array("action"=>".*")),
  );
