<?php


return array(

    "employers_comment_ajax" => array("pattern" => '/module/employers/comment/admin/{action}', 
                               "module" => "employers_comment", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);