<?php

// key=[action]
return array(
    
    "ajaxPublishComment"=>array('mode'=>'json','helpers'=>array('date'=>null)),
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);
