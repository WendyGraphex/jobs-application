<?php

// key=[action]
return array(
    
    "ajaxChangeIsActive"=>array('mode'=>'json'),     
    
    "ajaxEnable"=>array('mode'=>'json'),     
    
    "ajaxDisable"=>array('mode'=>'json'),
    
    "ajaxCheckEmail"=>array("mode"=>"json"),
    
    "ajaxSignIn"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxSaveAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteMyAddress"=>array("mode"=>"json"),
    
    "loginForMobile"=>array("mode"=>"json"),
    
    "ajaxSaveMyAccount"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxSaveSecurityAccount"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxSavePrivateAccount"=>array("mode"=>"json"),
  //  "ajaxForgotPasswordChange"=>array("mode"=>"json"),
    
  //  "ajaxSaveAccountCreate"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed',  // mixed : smarty View/Cache  | file: fichier  | uri              
    ),
        
   
    
);