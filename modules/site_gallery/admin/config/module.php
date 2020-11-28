<?php

return array(
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri  | header : header : only
    ),          
                    
    "ajaxChangeIsActivePicture"=>array("mode"=>"json"),
    
    "ajaxDeletePictureI18n"=>array("mode"=>"json","url"=>null),
                                     
    "ajaxDeletePicture"=>array("mode"=>"json","url"=>null),
    
    //"ajaxDeletesPicture"=>array("mode"=>"json"), 
    
    "ajaxSavePictureI18n"=>array("mode"=>"json"), 
      
    "ajaxChangeIsActiveGallery"=>array("mode"=>"json"), 
    
    "ajaxDeletePictureGallery"=>array("mode"=>"json"), 
    
    "ajaxChangeIsActivePictureGallery"=>array("mode"=>"json"), 
    
    "ajaxMoveGalleryPicture"=>array("mode"=>"json"), 
    
    "ajaxDeleteGallery"=>array("mode"=>"json"),
    
    "ajaxMovePictureForGalleryI18n"=>array("mode"=>"json"),
    
  //  "ajaxCopyPictures"=>array("mode"=>"json", 'helpers'=>array("url"=>null)), 
    
  //  "ajaxCopyGalleries"=>array("mode"=>"json", 'helpers'=>array("url"=>null)), 
    
    
);