<?php

// key=[action]
return array(        
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),      

      "ajaxDeleteProject"=>array('mode'=>'json'),
    
    "ajaxDeleteProjectDocument"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
    
    "ajaxNewProjectProfile"=>array('mode'=>'json'),
);