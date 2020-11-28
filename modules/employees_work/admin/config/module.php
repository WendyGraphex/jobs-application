<?php

// key=[action]
return array(
    
    
    "ajaxRequestConfirmed"=>array('mode'=>'json','helpers'=>array('date'=>null)),
   
    "ajaxRequestActive"=>array('mode'=>'json','helpers'=>array('date'=>null)),
    
    "ajaxRequestPlanned"=>array('mode'=>'json','helpers'=>array('date'=>null)),
    
    "ajaxDeleteRequests"=>array('mode'=>'json','helpers'=>array('number'=>null)),
    
    "ajaxDeleteRequest"=>array('mode'=>'json'),
    
    "ajaxRemoveRequest"=>array('mode'=>'json'),      
    
    "testEmail"=>array('mode'=>'json','helpers'=>array('number'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),    
    
    
    
);