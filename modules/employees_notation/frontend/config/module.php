<?php

// key=[action]
return array(
      
    "ajaxSaveEmployeeNotation"=>array('mode'=>'json'),
    
    "ajaxSaveEmployerNotation"=>array('mode'=>'json'),
   
    "ajaxSendProjectEmployerNotation"=>array('mode'=>'json'),
    
    "ajaxSendProjectEmployeeNotation"=>array('mode'=>'json'),
   
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);