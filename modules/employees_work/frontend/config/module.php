<?php

// key=[action]
return array(
        
    "ajaxRequestRefused"=>array('mode'=>'json','helpers'=>array('date'=>null,'number'=>null)),
    
    "ajaxRequestAccepted"=>array('mode'=>'json','helpers'=>array('date'=>null,'number'=>null)),
    
    "ajaxSaveDialogAmountRequestForEmployer"=>array('mode'=>'json','helpers'=>array('number'=>null)),
      
    "testEmail"=>array('mode'=>'json','helpers'=>array('number'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),      
          
);