<?php

// key=[action]
return array(
    
    
    "ajaxDeleteSession"=>array('mode'=>'json'),         
    
   
    "ajaxDisableStudent"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxEnableStudent"=>array("mode"=>"json","helpers"=>array('url'=>null)),

    "ajaxDeleteStudent"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxSaveAvatarStudent"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatarStudent"=>array("mode"=>"json","helpers"=>array("url"=>"")),
            
    "ajaxChangeIsActiveStudent"=>array("mode"=>"json"),
    
    "ajaxChangeIsValidatedStudent"=>array("mode"=>"json"),
    
    "ajaxChangeIsCompletedStudent"=>array("mode"=>"json"),    
        
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);