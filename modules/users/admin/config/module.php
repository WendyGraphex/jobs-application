<?php

// key=[action]
return array(
    
    "ajaxDeleteGroup"=>array("mode"=>"json"),
    
    "ajaxChangeUser"=>array("mode"=>"json"),
 
    "ajaxChangeUsers"=>array("mode"=>"json"),
    
    "ajaxChangeUserGroup"=>array("mode"=>"json"),
    
    "ajaxDeleteUser"=>array("mode"=>"json"),
    
    "ajaxDeletesUser"=>array("mode"=>"json"),
    
    "ajaxNewUserSave"=>array("mode"=>"json"),
    
    "ajaxUserSavePicture"=>array("mode"=>"json"),
    
    "ajaxDeletePictureUser"=>array("mode"=>"json"),
    
    "ajaxDeleteUserPermission"=>array("mode"=>"json"),
    
    "ajaxDeleteUserPermissions"=>array("mode"=>"json"),
    
    "ajaxRegeneratePassword"=>array("mode"=>"json"),        
    
    "ajaxNewUserCheckEmail"=>array("mode"=>"json"),
    
    "ajaxDeleteTeam"=>array("mode"=>"json"),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),

);
