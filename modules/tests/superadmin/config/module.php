<?php

// key=[action] "moduleAction"= ....
return array(
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true,         
               "mode"=>'none'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
  "datetimeTest"=>array(               
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
    
    "geo"=>array(               
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
   
    "validator"=>array(
        "mode"=>"none","helpers"=>array('date'=>'')
    ),
    
    "overlay"=>array("mode"=>"mixed"),
    
  
);