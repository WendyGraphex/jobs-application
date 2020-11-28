<?php

// key=[action]
return array(
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),    
    
    
    "ajaxChangeIsActivePayment"=>array("mode"=>"json"),   
    
    "ajaxDeleteMethod"=>array("mode"=>"json"),
);