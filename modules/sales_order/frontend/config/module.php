<?php

// key=[action]
return array(
      
    "ExportPdf"=>array("mode"=>"none",'helpers'=>array('url'=>'','date'=>null,'number'=>null)),    
    
    "ajaxCancelPaymentForEmployer"=>array("mode"=>"json",'helpers'=>array('date'=>null,'number'=>null)),    
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);