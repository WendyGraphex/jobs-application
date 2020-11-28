<?php

// key=[action] "moduleAction"= ....
return array(
       
    "ajaxDeleteUser"=>array("mode"=>"json",'helpers'=>array('url'=>'')),
           
    "ajaxChangeIsActiveUser"=>array("mode"=>"json"),
    
    "ajaxChangeIsValidatedUser"=>array("mode"=>"json"),
    
    "ajaxChangeIsCompletedUser"=>array("mode"=>"json"),    
    
    "ajaxDeleteEvent"=>array("mode"=>"json"),
    
    "ajaxChangeIsActiveEvent"=>array("mode"=>"json"),
    
     "ajaxUploadPictureEvent"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureNewEvent"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePictureEvent"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePlace"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxChangeIsActivePlace"=>array("mode"=>"json"),
    
    "ajaxDeleteDocumentEvent"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
    
    "ajaxPublicDocumentEvent"=>array('mode'=>'json'),
    
    "ajaxPrivateDocumentEvent"=>array('mode'=>'json'),
    
    "ajaxRefuseEvent"=>array("mode"=>"json"),
        
    "ajaxPublishEvent"=>array("mode"=>"json"),   
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header
                    ),
    
);