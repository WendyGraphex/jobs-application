<?php

return array(
     "site_client"=>array("pattern"=>'/site/client/{action}',"module"=>"site_client","action"=>"{action}","requirements"=>array("action"=>".*")),
    
    "site_client_ajax"=>array("pattern"=>'/module/site/client/admin/{action}',"module"=>"site_client","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
          
);

