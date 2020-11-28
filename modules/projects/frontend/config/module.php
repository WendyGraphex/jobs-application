<?php

// key=[action]
return array(
    
    "ajaxCloseForEmployee"=>array('mode'=>'json'),
    
    "ajaxFinishProject"=>array('mode'=>'json'),
    
    "ajaxChangeIsActiveTask"=>array('mode'=>'json'),
    
    "ajaxEnableTask"=>array('mode'=>'json'),
    
     "ajaxDisableTask"=>array('mode'=>'json'),
    
    "ajaxDeleteTask"=>array('mode'=>'json'),
    
    "ajaxChangeTaskState"=>array('mode'=>'json'),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),      
          
);