<?php

 
class SiteGalleryI18n extends SiteGalleryI18nBase {
       
       
     function getGalleryPictures()
     {
        if ($this->gallery_pictures===null)
        {
            $this->gallery_pictures=new SitePictureGalleryCollection();
            if ($this->getGallery()->isNotLoaded())
                return $this->gallery_pictures;
            $db=mfSiteDatabase::getInstance()
               ->setParameters(array("lang"=>$this->get('lang'),"gallery_id"=>$this->get('gallery_id')))
               ->setObjects(array('SitePictureI18n','SitePictureGallery','SitePicture'))
               ->setQuery("SELECT {fields} FROM ".SitePictureGallery::getTable().
                          " INNER JOIN ".SitePictureGallery::getOuterForJoin('picture_id').
                          " LEFT JOIN ".SitePictureI18n::getInnerForJoin('picture_id')." AND ".SitePictureI18n::getTableField('lang')."='{lang}'".                       
                          " WHERE ".SitePictureGallery::getTableField('gallery_id')."={gallery_id}".
                          " ORDER BY ".SitePictureGallery::getTableField('position')." ASC".
                          ";")
               ->makeSqlQuery(); 
          if (!$db->getNumRows())
               return $this->gallery_pictures; 
          while ($items=$db->fetchObjects())
          {
              $item=$items->getSitePictureGallery();
              $item->set('picture_id',$items->getSitePicture());
              $item->getPicture()->setI18n($items->hasSitePictureI18n()?$items->getSitePictureI18n():false);              
              $this->gallery_pictures[]=$item;
          }   
       }
       return $this->gallery_pictures;
     }
     
     
}



