<?php

// key=[action] "moduleAction"= ....
return array(
       
      "ajaxDeleteShop"=>array('mode'=>'json'),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
);