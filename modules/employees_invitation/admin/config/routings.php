<?php


return array(
    
   
    "employees_invitation_ajax" => array("pattern" => '/module/employees/invitation/admin/{action}', 
                               "module" => "employees_invitation", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);