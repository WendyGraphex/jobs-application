<?php

// key=[action]
return array(
      
  //    "ExportPdf"=>array("mode"=>"none",'helpers'=>array('url'=>'','date'=>null,'number'=>null)),    
    
     "ajaxCancelPaymentForUser"=>array('mode'=>'json',array('helpers'=>array('number'=>null,'date'=>null))),
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);