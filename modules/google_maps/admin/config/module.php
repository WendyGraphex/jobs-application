<?php

// key=[action] "moduleAction"= ....
return array(    
        
    "ajaxCalculateCoordinates"=>array('mode'=>'json'),
    
    "ajaxCalculateDistanceAndTime"=>array('mode'=>'json'),
        
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
    
);