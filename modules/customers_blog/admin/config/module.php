<?php

// key=[action]
return array(
    
    
    "ajaxDeleteArticle"=>array("mode"=>"json"),
    
    "ajaxChangeIsActiveArticle"=>array("mode"=>"json"),
    
    "ajaxUploadPictureArticle"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureNewArticle"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePictureArticle"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    
     "ajaxDeleteActivity"=>array("mode"=>"json"),
    
    "ajaxDeleteActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxChangeIsActiveActivity"=>array("mode"=>"json"),
    
    "ajaxUploadIconActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadPictureNewActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxUploadIconNewActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeletePictureActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeleteIconActivity"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxDeleteActivityMenu"=>array("mode"=>"json","helpers"=>array("url"=>null)),
    
    "ajaxChangeIsActiveActivityMenu"=>array("mode"=>"json"),
    
    "ajaxMoveActivityMenu"=>array("mode"=>"json"),
    
    "ajaxMoveActivity"=>array("mode"=>"json"),
    
       "ExportCsv"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
    
    "ajaxPublishArticle"=>array("mode"=>"json","helpers"=>array('date'=>null,'number'=>null)),
        
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);