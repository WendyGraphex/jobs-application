<?php

// key=[action]
return array(
    
  //  "login"=>array("cacheEnabled"=>true),
    "ajaxGeoLocation"=>array('mode'=>'none'),
    
    "loginForMobile"=>array('mode'=>'json',"always_access"=>true),
    
    "logoutForMobile"=>array('mode'=>'json'),
    
    "profileForMobile"=>array('mode'=>'json'),
    
    "ajaxGeoLocationError"=>array('mode'=>'json'),
    
    "ajaxLoginProfile"=>array('mode'=>'json'),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
    
    
);