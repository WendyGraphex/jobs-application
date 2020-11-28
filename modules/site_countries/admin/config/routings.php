<?php

return array(
     "site_countries"=>array("pattern"=>'/site/country/{action}',"module"=>"site_countries","action"=>"{action}","requirements"=>array("action"=>".*")),
    
    "site_countries_ajax"=>array("pattern"=>'/module/site/country/admin/{action}',"module"=>"site_countries","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
          
);

