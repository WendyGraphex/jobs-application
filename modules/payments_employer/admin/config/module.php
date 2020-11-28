<?php

// key=[action]
return array(
    
     "ajaxChangeIsActiveMethod"=>array('mode'=>'json'),
    
   "ajaxValidatePayment"=>array("mode"=>"json","helpers"=>array('number'=>null,'date'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),    
    
    
    
);