<?php

// key=[action]
return array(
    
    "ajaxTest"=>array("always_access"=>true),
    
    "ajaxSendSms"=>array("mode"=>"json"),
    
    
    "default"=>array(
                "enabled"=>true,
                "actionEnabled"=>true, 
                "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
            ),
    
    
);