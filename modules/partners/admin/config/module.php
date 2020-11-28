<?php

// key=[action]
return array(
    
    "ajaxDeleteActivity"=>array("mode"=>"json"),
    
    "ajaxDeleteCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxChangeIsActiveCategory"=>array("mode"=>"json"),
    
    "ajaxUploadIconCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureNewCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadIconNewCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePictureCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeleteIconCategory"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeleteCategoryMenu"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxChangeIsActiveCategoryMenu"=>array("mode"=>"json"),
    
    "ajaxMoveCategoryMenu"=>array("mode"=>"json"),
    
    "ajaxMoveCategory"=>array("mode"=>"json"),
    
       "ExportCsv"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
   
    
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);