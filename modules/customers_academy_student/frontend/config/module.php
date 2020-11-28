<?php

// key=[action]
return array(
    
        
     "ajaxCheckEmail"=>array("mode"=>"json"),     
    
    "ajaxSaveAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),  
    
     "ajaxDeleteAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),   
    
     "ajaxUnlock"=>array('mode'=>'json'),
    
     "ajaxLock"=>array('mode'=>'json'),
    
    "ajaxLogin"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
            
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
    
   
    
);