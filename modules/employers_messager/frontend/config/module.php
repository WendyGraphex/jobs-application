<?php

// key=[action]
return array(
    
    "ajaxDeleteMessage"=>array('mode'=>'json'),     
    
    "ajaxDeleteFile"=>array('mode'=>'json','helpers'=>array('url'=>null)),     

    "ajaxSendMessageToEmployer"=>array('mode'=>'json'),     
    
    "ajaxSendMessageForQuotation"=>array('mode'=>'json'),    
    
    "ajaxSendMessageForRequest"=>array('mode'=>'json'),    
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);