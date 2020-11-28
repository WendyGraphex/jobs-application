<?php


return array(

    "site_city_ajax" => array("pattern" => '/module/site/city/admin/{action}', 
                               "module" => "site_city", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);