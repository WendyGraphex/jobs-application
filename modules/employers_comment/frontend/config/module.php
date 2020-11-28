<?php

// key=[action]
return array(
            
    "ajaxSendAdvertComment"=>array('mode'=>'json','helpers'=>array('date'=>null,'url'=>null)),
    
     "ajaxSendProjectEmployeeComment"=>array('mode'=>'json','helpers'=>array('date'=>null,'url'=>null)),
    
    "ajaxSendProjectEmployerComment"=>array('mode'=>'json','helpers'=>array('date'=>null,'url'=>null)),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);