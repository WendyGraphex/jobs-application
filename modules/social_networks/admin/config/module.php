<?php

// key=[action] "moduleAction"= ....
return array(
    
    "ajaxSavePictureSocial"=>array("mode"=>"json"),
    
    "ajaxDeletePictureSocial"=>array("mode"=>"json"),
    
    "ajaxDeleteSocial"=>array("mode"=>"json"),
    
    "ajaxDeletesSocial"=>array("mode"=>"json"),
    
    "ajaxMoveSocial"=>array("mode"=>"json"),
    
    "ajaxChangeIsActiveSocial"=>array("mode"=>"json"),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
);