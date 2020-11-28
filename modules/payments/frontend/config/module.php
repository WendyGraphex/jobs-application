<?php

// key=[action]
return array(
    
    "ajaxProcess"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
    "ajaxCreditProcess"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
     "ajaxProcessEventDebit"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),      
          
);