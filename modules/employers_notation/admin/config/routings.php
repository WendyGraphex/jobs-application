<?php


return array(

    "employers_notation_ajax" => array("pattern" => '/module/employers/notation/admin/{action}', 
                               "module" => "employers_notation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);