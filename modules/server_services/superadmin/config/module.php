<?php

// key=[action]
return array(
    
    "ServiceLogin"=>array('mode'=>'json',"always_access"=>true),
    
  //  "ServiceListSites"=>array('mode'=>'json'),
    
   // "ServicePing"=>array('mode'=>'json'),
    
   // "ServiceChangeAdminSites"=>array('mode'=>'json'),
    
    "ajaxPingServer"=>array('mode'=>'json'),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),

);