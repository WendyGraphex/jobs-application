<?php

// key=[action]
return array(
    
     "ajaxDeleteStateI18n"=>array("mode"=>"json",'helpers'=>array('url'=>'')),
    
    "ajaxDeleteState"=>array("mode"=>"json",'helpers'=>array('url'=>'')),
    "ajaxDeleteQuotation"=>array("mode"=>"json"),
   
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);
