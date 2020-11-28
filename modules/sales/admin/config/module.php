<?php

// key=[action]
return array(
    
      "ajaxDeleteTax"=>array("mode"=>"json"),
   
     "ajaxDeleteEmployerCommission"=>array("mode"=>"json"),
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);