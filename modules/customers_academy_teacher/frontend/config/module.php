<?php

// key=[action]
return array(
    
        
     "ajaxCheckEmail"=>array("mode"=>"json"),     
    
    "ajaxSaveAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),  
    
     "ajaxDeleteAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),   
    
     "ajaxUnlock"=>array('mode'=>'json'),
    
     "ajaxLock"=>array('mode'=>'json'),
    
    "ajaxLogin"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
    
    "ajaxDeleteCourseDocument"=>array("mode"=>"json","helpers"=>array("url"=>"")),   
    
    "ajaxPublicCourseDocument"=>array('mode'=>'json'),
    
    "ajaxPrivateCourseDocument"=>array('mode'=>'json'),
    
    "ajaxCommitCourseI18n"=>array('mode'=>'json','helpers'=>array('date'=>null)),
           
    "ajaxDeleteCourseI18n"=>array('mode'=>'json'),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
    
   
    
);