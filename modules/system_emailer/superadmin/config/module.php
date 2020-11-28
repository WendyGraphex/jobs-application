<?php

// key=[action] "moduleAction"= ....
return array(
    
 
    
    "ajaxSendEmail"=>array("mode"=>"json"),
    
    "ajaxSendEmailByDefault"=>array("mode"=>"json"),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
);