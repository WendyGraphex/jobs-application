<?php

 
class SitePictureGalleryUtils {
    
   /* static function getPictureSiteGalleryByLangAndName($name,$lang)
    {                
         $pictures=array();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array("lang"=>$lang,"name"=>$name))
            ->setObjects(array('SitePictureI18n','SitePictureGallery','SitePicture'))
            ->setQuery("SELECT {fields} FROM ".SitePictureI18n::getTable().
                       " LEFT JOIN ".SitePictureI18n::getOuterForJoin('picture_id')." AND ".SitePictureI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".SitePictureGallery::getInnerForJoin('picture_id').
                       " LEFT JOIN ".SitePictureGallery::getOuterForJoin('gallery_id').
                       " LEFT JOIN ".SiteGalleryI18n::getInnerForJoin('gallery_id')." AND ".SiteGalleryI18n::getTableField('lang')."='{lang}'".                     
                       " WHERE ".SiteGallery::getTableField('name')."='{name}'".
                       " AND ".SitePictureGallery::getTableField('is_active')."='YES'".
                       " AND ".SiteGalleryI18n::getTableField('is_active')."='YES'".
                       " ORDER BY position ASC ".
                        ";")
            ->makeSiteSqlQuery(); 
       if (!$db->getNumRows())
            return null; 
       while ($item=$db->fetchObjects())
       {
           $pictures[]=$item;
       }           
       return $pictures;     
    }    */   
                                                             
}
