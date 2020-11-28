<?php

// key=[action] "moduleAction"= ....
return array(
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true,         
               "mode"=>'none'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
  
   "test"=>array('helpers'=>array('number'=>null))
);