<?php

// key=[action]
return array(
    
  //  "return"=>array("always_access"=>true,"mode"=>"none"),
    
   // "SentNotification"=>array("always_access"=>true,"mode"=>"json"),
    
  //  "ReturnNotification"=>array("always_access"=>true,"mode"=>"json"),
    
    "ReturnCallback"=>array("mode","none"),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
    
    
);