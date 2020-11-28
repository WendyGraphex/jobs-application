<?php


return array(

    "google_oauth_ajax" => array("pattern" => '/module/google/oauth/admin/{action}', 
                               "module" => "google_oauth", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

);
