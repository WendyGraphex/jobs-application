<?php

// key=[action]
return array(
    
      "ExportCsv"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
    
    "ajaxDeleteContact"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
  /*  "ajaxDeleteUserAdmin"=>array('mode'=>'json'),     
    
    "ajaxEnableUserAdmin"=>array('mode'=>'json'),     
    
    "ajaxDisableUserAdmin"=>array('mode'=>'json'),
    
    "ajaxDeleteUser"=>array('mode'=>'json'),     
    
    "ajaxEnableUser"=>array('mode'=>'json'),     
    
    "ajaxDisableUser"=>array('mode'=>'json'),
        
    "ajaxChangeIsActiveCustomer"=>array("mode"=>"json"),
    
    "ajaxDeleteCustomer"=>array("mode"=>"json"),
        
    "ajaxDeleteSubmission"=>array("mode"=>"json"),
        
    "ajaxDeletecustomer"=>array("mode"=>"json"),
    
    "ajaxDisablecustomer"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxEnablecustomer"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxSaveAvatarCustomer"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatarCustomer"=>array("mode"=>"json","helpers"=>array("url"=>"")),
      
     "ajaxChangeIsActive"=>array("mode"=>"json"),
    
    "ajaxDelete"=>array("mode"=>"json"),
           
    "ajaxDelete"=>array('mode'=>'json','helpers'=>array('url'=>'')),
            
     "ajaxSave"=>array('mode'=>'json','helpers'=>array('url'=>'')),
        
    "ajaxRegeneratePasswordUser"=>array("mode"=>"json",'helpers'=>array('date'=>null)),
    
    "ajaxChangeIsActiveCustomer"=>array("mode"=>"json"),
    
     "ajaxDeleteAbuseType"=>array("mode"=>"json"),*/
        
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);