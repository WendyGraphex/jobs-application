<?php


return array(

    "employers_contact_ajax" => array("pattern" => '/module/employers/contact/admin/{action}', 
                               "module" => "employers_contact", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);