<?php

 
class SiteGalleryI18nBase extends mfObject3 {
    
    const table="t_site_gallery_i18n";     
    protected static $fields=array('lang','title','link','gallery_id','created_at', 'updated_at');  
   protected static $foreignKeys=array('gallery_id'=>'SiteGallery'); 
   protected static $fieldsNull=array('updated_at');   
   
  function __construct($parameters=null) {
      parent::__construct();    
    $this->getDefaults();     
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {          
           if (isset($parameters['lang']) && isset($parameters['gallery_id']))
               return $this->loadByGalleryAndLang((string)$parameters['gallery_id'],(string)$parameters['lang']);
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);           
           if (isset($parameters['lang']) && isset($parameters['name']) && isset($parameters['title'])) // For Import
               return $this->loadByLangAndNameorTitle((string)$parameters['lang'],(string)$parameters['name'],(string)$parameters['title']);
        //   if (isset($parameters['name']))
        //       return $this->loadByName((string)$parameters['name']); 
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
      }   
    }
    
     protected function loadByLangAndNameOrTitle($lang,$name,$title)
    {        
        $this->set('lang',$lang);
        $this->set('title',$title);
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array('name'=>$name,'title'=>$title,'lang'=>$lang))
          ->setObjects(array('SiteGallery','SiteGalleryI18n'))
          ->setQuery("SELECT {fields} FROM ".self::getTable().
                     " LEFT JOIN ".self::getOuterForJoin('gallery_id').
                     " WHERE (name='{name}' OR title='{title}') AND lang='{lang}' LIMIT 0,1;")
          ->makeSqlQuery();    
        if (($items=$db->fetchObjects())===false)                
           return;         
        if ($item->hasSiteGalleryI18n())
            $this->toObject($items->getSiteGalleryI18n());
        if ($item->hasSiteGallery())                        
            $this->add(array('gallery_id'=>$items->getSiteGallery(),'name'=>$name));           
    }  
    
     protected function loadByGalleryAndLang($gallery_id,$lang)
    {                                 
        $this->set('lang',$lang);
        $this->set('gallery_id',$gallery_id);
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array('gallery_id'=>$gallery_id,'lang'=>$lang))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE gallery_id='{gallery_id}' AND lang='{lang}';")
          ->makeSqlQuery();              
        return $this->rowtoObject($db);
    }   
    
    
    protected function getDefaults()
    {	       
        $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
	$this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
    }      
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s")); 
    }   
    
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('lang'=>$this->get('lang'),'title'=>$this->get('title'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE lang='{lang}' AND title='{title}' ".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
      
    function getGallery()
     {
        return $this->_gallery_id=$this->_gallery_id===null?new SiteGallery($this->get('gallery_id')):$this->_gallery_id;
     }
     
     
     function getLanguage()
     {
         return new LanguageFormatter($this->get('lang'));
     }
    
     
    
}



