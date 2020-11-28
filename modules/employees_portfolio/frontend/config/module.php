<?php

// key=[action]
return array(
      
    "ajaxDeleteDocument"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxPublicDocument"=>array("mode"=>"json"),
    
    "ajaxPrivateDocument"=>array("mode"=>"json"),
    
    "ajaxChangeIsActiveDocument"=>array("mode"=>"json"),
    
    "ajaxSaveDocument"=>array("mode"=>"json"),
    
    "ajaxMoveDocument"=>array("mode"=>"json"),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);