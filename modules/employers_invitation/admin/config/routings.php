<?php


return array(
    
   
    "employers_invitation_ajax" => array("pattern" => '/module/employers/invitation/admin/{action}', 
                               "module" => "employers_invitation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);