<?php

// key=[action]
return array(
    
    "ajaxDeleteStateI18n"=>array("mode"=>"json",'helpers'=>array('url'=>'')),
    
    "ajaxDeleteState"=>array("mode"=>"json",'helpers'=>array('url'=>'')),    
    
    "ajaxDeleteBilling"=>array("mode"=>"json"),
    
    "GeneratePdf"=>array("mode"=>"none",'helpers'=>array('url'=>'','date'=>null,'number'=>null)),    
   
    "ExportPdf"=>array("mode"=>"none",'helpers'=>array('url'=>'','date'=>null,'number'=>null)),    
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);
