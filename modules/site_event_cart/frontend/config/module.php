<?php

// key=[action]
return array(
    
 //   "ajaxAddQuotationToCart"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
  
    
    "ajaxDeleteCartEvent"=>array("mode"=>"json",'helpers'=>array('number'=>null,'date'=>null)),
   
    "ajaxAddEventToCart"=>array("mode"=>"json",'helpers'=>array('number'=>null,'date'=>null)),
        

    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);