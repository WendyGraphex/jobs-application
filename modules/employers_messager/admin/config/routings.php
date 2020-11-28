<?php


return array(

    "employers_messager_ajax" => array("pattern" => '/module/employers/messager/admin/{action}', 
                               "module" => "employers_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

     "employers_messager" => array("pattern" => '/employers/messager/admin/{action}', 
                               "module" => "employers_messager", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")), 
    
    "employers_messager_test" => array("pattern" => '/employer/messager/test/{action}', 
                               "module" => "employers_messager", 
                               "action" => "test{action}", 
                               "requirements" => array("action" => ".*")), 
);