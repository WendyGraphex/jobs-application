<?php

// key=[action]
return array(
    
    "ajaxDeleteUserAdmin"=>array('mode'=>'json'),     
    
    "ajaxEnableUserAdmin"=>array('mode'=>'json'),     
    
    "ajaxDisableUserAdmin"=>array('mode'=>'json'),
    
    "ajaxDeleteUser"=>array('mode'=>'json'),     
    
    "ajaxDeleteSession"=>array('mode'=>'json'),
    
    "ajaxEnableUser"=>array('mode'=>'json'),     
    
    "ajaxDisableUser"=>array('mode'=>'json'),          
    
        
    "ajaxDeleteSubmission"=>array("mode"=>"json"),
        
    "ajaxDeleteEmployee"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxDisableEmployee"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxEnableEmployee"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    "ajaxSaveAvatarEmployee"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatarEmployee"=>array("mode"=>"json","helpers"=>array("url"=>"")),
          
    "ajaxDelete"=>array("mode"=>"json"),
           
    "ajaxDelete"=>array('mode'=>'json','helpers'=>array('url'=>'')),
            
     "ajaxSave"=>array('mode'=>'json','helpers'=>array('url'=>'')),
        
    "ajaxRegeneratePasswordUser"=>array("mode"=>"json",'helpers'=>array('date'=>null)),
          
    "ajaxDeleteContact"=>array("mode"=>"json"),
    
    "ajaxDeleteAlert"=>array("mode"=>"json"),      

   "ajaxDeleteRequest"=>array("mode"=>"json"), 
    
    "ajaxChangeIsActiveEmployee"=>array("mode"=>"json"),
    
    "ajaxChangeIsValidatedEmployee"=>array("mode"=>"json"),
    
    "ajaxChangeIsCompletedEmployee"=>array("mode"=>"json"),    
    
    "ajaxChangeIsActiveGallery"=>array("mode"=>"json"),    
    
    "ajaxDeleteGallery"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteLevel"=>array("mode"=>"json"),
    
    "ajaxDeleteEmployeeForGalleryI18n"=>array("mode"=>"json"),
    
    "ajaxRefuseAdvertI18n"=>array("mode"=>"json"),
        
    "ajaxPublishAdvertI18n"=>array("mode"=>"json"),   
    
    "ajaxDeleteLanguageLevel"=>array("mode"=>"json"),
    
    "ajaxDeleteSkill"=>array("mode"=>"json"),
    
    "ajaxDeleteGraduate"=>array("mode"=>"json"),    
    
    
    "ExportSkillCsv"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),       
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);