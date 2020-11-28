<?php

// key=[action]
return array(
    
    "ajaxDeleteType"=>array("mode"=>"json"),   
    
    "ajaxDeleteContactClaim"=>array('mode'=>'json'),            
        
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);