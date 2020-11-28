<?php

// key=[action]
return array(
            
    "ajaxCheckEmail"=>array("mode"=>"json"),     
    
    "ajaxSaveAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
     "ajaxDeleteMyAvatar"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteCompanyPicture"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteCompanyLogo"=>array("mode"=>"json","helpers"=>array("url"=>"")),
    
    "ajaxDeleteMyAddress"=>array("mode"=>"json"),

    "ajaxSaveCoordinates"=>array('mode'=>'json'),
    
    "ajaxSaveAdverts"=>array('mode'=>'json'),
        
    "ajaxUnlock"=>array('mode'=>'json'),
    
     "ajaxLock"=>array('mode'=>'json'),
    
    "ajaxCommitAdvert"=>array('mode'=>'json',"helpers"=>array("date"=>"")),
    
    "ajaxDeleteAdvertI18n"=>array('mode'=>'json'),
    
    "ajaxDeleteAdvert"=>array('mode'=>'json'),
    
    "ajaxDeleteAdvertDocument"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
    
    "ajaxDeleteUser"=>array('mode'=>'json'),
    
    "ajaxPublicAdvertDocument"=>array('mode'=>'json'),
    
    "ajaxPrivateAdvertDocument"=>array('mode'=>'json'),
    
    "ajaxLogin"=>array('mode'=>'json',"helpers"=>array("url"=>"")),       
    
    "ajaxSearchCity"=>array('mode'=>'json'),
    
     "ajaxSaveEmployerAdvertFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteEmployerAdvertFavourite"=>array('mode'=>'json'),
    
       "ajaxSaveEmployeeAdvertFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteEmployeeAdvertFavourite"=>array('mode'=>'json'),
    
     "ajaxSaveEmployeeFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteEmployeeFavourite"=>array('mode'=>'json'),
    
    "ajaxSaveEmployerFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteEmployerFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteFavourite"=>array('mode'=>'json'),
    
    "ajaxDeleteSearch"=>array('mode'=>'json'),
    
    "ajaxCheckUsername"=>array('mode'=>'json'),
    
   // "ajaxSavePostAJobAdvertProfile"=>array('mode'=>'json',"helpers"=>array("url"=>"","number"=>null)),
    
     "ajaxDeleteAdvertDocumentProfile"=>array('mode'=>'json',"helpers"=>array("url"=>"")),
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);