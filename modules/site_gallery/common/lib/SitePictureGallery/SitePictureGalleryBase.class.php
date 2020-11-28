<?php

 
class SitePictureGalleryBase extends  OrderedObject {
    
    const table="t_site_gallery_picture";     
    protected static $fields=array('picture_id','gallery_id','position','is_active');  
    protected static $foreignKeys=array('picture_id'=>'SitePicture','gallery_id'=>'SiteGallery'); 
       
  function __construct($parameters=null) {
    parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
         //   if (isset($parameters['gallery_i18n_id']) && isset($parameters['picture_i18n_id']))
         //      return $this->loadByPictureI18nIdAndGalleryI18nId((string)$parameters['picture_i18n_id'],(string)$parameters['gallery_i18n_id']);         
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
      }   
    }
    
   /* protected function loadByPictureI18nIdAndGalleryI18nId($picture_i18n_id,$gallery_i18n_id)
    {
           
        $db=mfSiteDatabase::getInstance()
          ->setObjects(array('SitePictureGallery','SitePicture','SitePictureI18n','SiteGallery','SiteGalleryI18n'))
          ->setParameters(array('picture_i18n_id'=>$picture_i18n_id,'gallery_i18n_id'=>$gallery_i18n_id))
          ->setQuery("SELECT {fields} FROM ".self::getTable().                      
                     " INNER JOIN ".self::getOuterForJoin('picture_id').
                     " INNER JOIN ".self::getOuterForJoin('gallery_id').
                     " INNER JOIN ".SitePictureI18n::getInnerForJoin('picture_id').
                     " INNER JOIN ".SiteGalleryI18n::getInnerForJoin('gallery_id').
                     " WHERE ".SitePictureI18n::getTableField('id')."='{picture_i18n_id}' AND ".
                               SiteGalleryI18n::getTableField('id')."='{gallery_i18n_id}'".
                     ";")
          ->makeSiteSqlQuery($this->site); 
         if (!$db->getNumRows())
             return ;
         $items=$db->fetchObjects();
        $this->toObject($items->getSitePictureGallery());
        $this->set('picture_id',$items->getSitePicture());
        $this->getPicture()->setI18n($items->getSitePictureI18n());
        $this->set('gallery_id',$items->getSiteGallery());
        $this->getGallery()->setI18n($items->getSiteGalleryI18n());        
    }*/
    
    protected function executeLoadById($db)
    {        
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSiteSqlQuery($this->site);   
    }
    
    protected function getDefaults()
    {	        
	$this->is_active=isset($this->is_active)?$this->is_active:"NO";	
    }
    
    protected function executeInsertQuery($db)
    {
         $db->makeSqlQuery();   
    }
    
    function getValuesForUpdate()
    {      
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery();    
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuery();     
    }
    
  /*  protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('lang'=>$this->lang,'url'=>$this->url,'name'=>$this->name,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE ((lang='{lang}' AND url='{url}') OR (lang='{lang}' AND name='{name}' AND url='{url}'))".$key_condition)
         ->makeSqlQuery(); 
    }*/
    
    protected function executeLastPositionQuery($db)
    {
     $db->setQuery("SELECT max(position) FROM ".static::getTable().";")
        ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
       $db->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d;")
           ->makeSqlQuery(); 
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d;")
           ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d;")
          ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position};")
        ->makeSqlQuery(); 
    }
     
    function getPicture()
    {
        return $this->_picture_id=$this->_picture_id===null?new SitePicture($this->get('picture_id')):$this->_picture_id;
    }
    
    function getGallery()
    {
        return $this->_gallery_id=$this->_gallery_id===null?new SiteGallery($this->get('gallery_id')):$this->_gallery_id;
    }
    
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}



