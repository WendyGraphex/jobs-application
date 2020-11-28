<?php

// key=[action]
return array(
    
    
    "ajaxDeleteSession"=>array('mode'=>'json'),         
    
  
    "ajaxDisableTeacher"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxDeleteTeacher"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxEnableTeacher"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxSaveAvatarTeacher"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatarTeacher"=>array("mode"=>"json","helpers"=>array("url"=>"")),
            
    "ajaxChangeIsActiveTeacher"=>array("mode"=>"json"),
    
    "ajaxChangeIsValidatedTeacher"=>array("mode"=>"json"),
    
    "ajaxChangeIsCompletedTeacher"=>array("mode"=>"json"),        
        
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);