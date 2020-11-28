<?php

 
class SiteGalleryBase extends mfObject3 {
    
    const table="t_site_gallery";     
    protected static $fields=array('name','component','height','width','effect',
            'slices','boxCols','boxRows','animSpeed','pauseTime','startSlide',
            'directionNav','controlNav','controlNavThumbs','pauseOnHover',
            'manualAdvance','randomStart','is_fullscreen', 'template',
            'start_at','expired_at','is_active','created_at', 'updated_at');      
     protected static $fieldsNull=array('start_at','expired_at','updated_at');   
   
  function __construct($parameters=null) {
      parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
         
      }   
    }
    
     protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),          
            'is_active'=>"NO",   
            'effect'=>'random',    
            'slices'=> 15,                     // For slice animations
            'boxCols'=>8,                     // For box animations
            'boxRows'=>4,                     // For box animations
            'animSpeed'=>500,                 // Slide transition speed
            'pauseTime'=>3000,                // How long each slide will show
            'startSlide'=>0,                  // Set starting Slide (0 index)
            'directionNav'=>"YES",             // Next & Prev navigation
            'controlNav'=>"YES",               // 1,2,3... navigation
            'controlNavThumbs'=>"NO",        // Use thumbnails for Control Nav
            'pauseOnHover'=>"YES",             // Stop animation while hovering
            'manualAdvance'=>"NO",           // Force manual transitions    
            'randomStart'=>"NO",
            'is_fullscreen'=>"NO",
            'is_active'=>"NO",
            'component'=>"/site_gallery/default",
            'template'=>"default",
        ));      
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s")); 
    }   
        
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->name,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
    function setI18n($i18n)
    {
        $this->i18n=$i18n;
        return $this;
    }
    
    function hasI18n()
    {
        return (boolean)$this->i18n;       
    }
    
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {           
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new SiteGalleryI18n(array('lang'=>$lang,"gallery_id"=>$this->get('id')));
             var_dump($this->i18n);
              die(__METHOD__);
         }   
         return $this->i18n;
     } 
     
        
                           
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    
     function updatePictures(SitePictureCollection $collection)
     {
        if ($collection->isEmpty())             
            return $this;       
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('gallery_id'=>$this->get('id')))              
                ->setQuery("SELECT picture_id FROM ".SitePictureGallery::getTable().                            
                           " WHERE ".SitePictureGallery::getTableField('gallery_id')."='{gallery_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $collection->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $picture_gallery = new SitePictureGalleryCollection();
         foreach ($collection as $picture)
         {    
             $item= new SitePictureGallery();
             $item->add(array('picture_id'=>$picture,'gallery_id'=>$this));
             $picture_gallery[]=$item;
         }
          $picture_gallery->save(); 
         return $this;        
     }
}



