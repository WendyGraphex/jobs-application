<?php

// key=[action]
return array(
    
    "ExportCsvContact"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
    
    "ajaxDeleteContact"=>array("mode"=>"json"),
    
    "ajaxDeleteCategory"=>array("mode"=>"json"),
    
    "ajaxChangeIsActiveCategory"=>array("mode"=>"json"),
    
    "ajaxUploadIconCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePictureCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),    
    
    "ajaxDeleteLevel"=>array("mode"=>"json"),
    
    "ajaxDeleteTopic"=>array("mode"=>"json"),
    
     "ajaxDeleteSoftware"=>array("mode"=>"json"),
    
       "ajaxRefuseCourseI18n"=>array("mode"=>"json"),
        
    "ajaxPublishCourseI18n"=>array("mode"=>"json"),   
        
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);