<?php

 
class SiteGallery extends SiteGalleryBase {
    
    function __construct($parameters = null,$language=null) {                        
      if (is_string($parameters) && $language)    
          $this->loadByNameAndLang($parameters,$language);       
       
    }
    
              
    function loadByNameAndLang($name,$lang)
    {                        
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array("lang"=>$lang,"name"=>$name))
            ->setObjects(array('SiteGalleryI18n','SiteGallery'))
            ->setQuery("SELECT {fields} FROM ".SiteGallery::getTable().                      
                       " INNER JOIN ".SiteGalleryI18n::getInnerForJoin('gallery_id').        
                       " WHERE ".SiteGallery::getTableField('name')."='{name}'".
                       " AND ".SiteGallery::getTableField('is_active')."='YES'". 
                       " AND ".SiteGalleryI18n::getTableField('lang')."='{lang}'".             
                        ";")
            ->makeSiteSqlQuery(); 
       if (!$db->getNumRows())
            return ;
       $items=$db->fetchObjects();
       $this->toObject($items->getSiteGallery());
       $this->setI18n($items->getSiteGalleryI18n());
    }
    
     function getPictures()
    {    
         if ($this->pictures===null)
         {    
            $this->pictures=new SitePictureCollection();
            $db=mfSiteDatabase::getInstance()
               ->setParameters(array("lang"=>$this->getI18n()->get('lang'),'gallery_id'=>$this->get('id')))
               ->setObjects(array('SitePictureI18n','SitePicture'))
               ->setQuery("SELECT {fields} FROM ".SitePictureGallery::getTable().
                          " INNER JOIN ".SitePictureGallery::getOuterForJoin('picture_id').              
                          " LEFT  JOIN ".SitePictureI18n::getInnerForJoin('picture_id'). " AND ".SitePictureI18n::getTableField('lang')."='{lang}'".                                                
                          " WHERE ".SitePictureGallery::getTableField('gallery_id')."='{gallery_id}'".
                            " AND ".SitePictureGallery::getTableField('is_active')."='YES'".
                          //  " AND ".SiteGalleryI18n::getTableField('is_active')."='YES'".
                            
                          " ORDER BY position ASC ".
                           ";")
               ->makeSiteSqlQuery();         
          if (!$db->getNumRows())
               return $this->pictures;    
          while ($items=$db->fetchObjects())
          {
              $item=$items->getSitePicture();
              $item->setI18n($items->hasSitePictureI18n()?$items->getSitePictureI18n():false);
              $this->pictures[]=$item;
          }       
        }
       return $this->pictures;    
    }
}



