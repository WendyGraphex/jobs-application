<?php

return array(
    
     "site_services_ajax"=>array("pattern"=>'/module/server/services/admin/{action}',"module"=>"site_services","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
    
    "site_services"=>array("pattern"=>'/services/server/admin/{action}',"module"=>"site_services","action"=>"Service{action}","requirements"=>array("action"=>".*")),

    );

