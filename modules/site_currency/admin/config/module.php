<?php

// key=[action]
return array(
    
    "ajaxChangeIsActiveCustomer"=>array("mode"=>"json"),
    
    "ajaxChangeCurrencyIsActive"=>array("mode"=>"json"),
        
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);