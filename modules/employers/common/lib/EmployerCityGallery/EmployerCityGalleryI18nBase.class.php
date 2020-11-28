<?php

/*
 *  `layout` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `template` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `content` text COLLATE utf8_bin NOT NULL,  
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
 */
 
         
class EmployerCityGalleryI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','gallery_id','lang','created_at','updated_at');
    const table="t_employer_city_gallery_i18n"; 
    protected static $foreignKeys=array('gallery_id'=>'EmployerCityGallery');  
    
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['gallery_id']))
              return $this->loadByLangAndGalleryId((string)$parameters['lang'],(string)$parameters['gallery_id']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['name']))
              return $this->loadByLangAndName((string)$parameters['lang'],(string)$parameters['name']); 
        //  if (isset($parameters['lang']) && isset($parameters['title']))
        //      return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['title']); 
         // if (isset($parameters['title']))
         //     return $this->loadByTitle((string)$parameters['title']); 
         // if (isset($parameters['name']))
         //     return $this->loadByName((string)$parameters['name']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByTitle((string)$parameters);
      }   
    }        
    
     protected function loadByLangAndName($lang,$name)
    {             
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name,"lang"=>$lang))              
            ->setObjects(array('EmployerCityGalleryI18n','EmployerCityGallery'))
            ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                       " INNER JOIN ".self::getOuterForJoin('gallery_id').
                       " WHERE lang='{lang}' AND name='{name}' AND name!='' LIMIT 0,1;")
            ->makeSqlQuery(); 
      // echo $db->getQuery();
       if (!$db->getNumRows())
                return ;
        $items=$db->fetchObjects();      
         $this->toObject($items->getEmployerCityGalleryI18n());
        $this->set('gallery_id',$items->getEmployerCityGallery());
    }
    
     protected function loadByLangAndGalleryId($lang,$gallery_id)
    {       
       $this->set('gallery_id',$gallery_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('gallery_id'=>$gallery_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND gallery_id={gallery_id};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%d';")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),           
        ));   
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();  
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
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
     
    protected function executeIsExistQuery($db)    
    {
      
        $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('title'=>$this->get('title'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE title='{title}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();  
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("gallery_id"=>$this->get('gallery_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE gallery_id={gallery_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getEmployer()->delete();
        return $this;
    }  
   
     function getGallery()
    {      
       return $this->_gallery_id=$this->_gallery_id===null?new EmployerCityGallery($this->get('gallery_id')):$this->_gallery_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
    
    
    function getCities()
     {
         if ($this->cities===null)
         {
             $this->cities = new EmployerCityCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("gallery_id"=>$this->get('gallery_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('EmployerCity','EmployerCityI18n'))
                    ->setQuery("SELECT {fields} FROM ".EmployerCityGalleryCity::getTable().                              
                               " INNER JOIN ".EmployerCityGalleryCity::getOuterForJoin('city_id').
                               " LEFT JOIN ".EmployerCityI18n::getInnerForJoin('city_id'). " AND ".EmployerCityI18n::getTableField('lang')."='{lang}'".                                                                                                                
                               " WHERE gallery_id={gallery_id}".
                               " ORDER BY ".EmployerCityGalleryCity::getTableField('position')." ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->cities;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployerCity();              
               $item->setI18n($items->hasEmployerCityI18n()?$items->getEmployerCityI18n():false);
               $this->cities[$item->get('id')]=$item;
            }    
         }
         return $this->cities;
     }
     
     function getGalleryCities()
     {
         if ($this->gallery_cities===null)
         {
             $this->gallery_cities = new EmployerCityGalleryCityCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("gallery_id"=>$this->get('gallery_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('EmployerCity','EmployerCityI18n','EmployerCityGalleryCity'))
                    ->setQuery("SELECT {fields} FROM ".EmployerCityGalleryCity::getTable().                              
                               " INNER JOIN ".EmployerCityGalleryCity::getOuterForJoin('city_id').
                               " LEFT JOIN ".EmployerCityI18n::getInnerForJoin('city_id'). " AND ".EmployerCityI18n::getTableField('lang')."='{lang}'".                                                                                                                
                               " WHERE gallery_id={gallery_id}".
                               " ORDER BY ".EmployerCityGalleryCity::getTableField('position')." ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->gallery_cities;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployerCityGalleryCity();   
               $item->set('city_id',$items->getEmployerCity());
               $item->getCity()->setI18n($items->hasEmployerCityI18n()?$items->getEmployerCityI18n():false);
               $this->gallery_cities[$item->get('id')]=$item;
            }    
         }
         return $this->gallery_cities;
     }
     
     
     function getCitiesI18n()
     {
         if ($this->cities_i18n===null)
         {
             $this->cities_i18n = new EmployerCityCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("gallery_id"=>$this->get('gallery_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('EmployerCity','EmployerCityI18n'))
                    ->setQuery("SELECT {fields} FROM ".EmployerCityGalleryCity::getTable().                              
                               " INNER JOIN ".EmployerCityGalleryCity::getOuterForJoin('city_id').
                               " INNER JOIN ".EmployerCityI18n::getInnerForJoin('city_id'). " AND ".EmployerCityI18n::getTableField('lang')."='{lang}'".                                                                                                                
                               " WHERE gallery_id={gallery_id}".
                               " ORDER BY ".EmployerCityGalleryCity::getTableField('position')." ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->cities_i18n;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployerCity();              
               $item->setI18n($items->getEmployerCityI18n());
               $this->cities_i18n[$item->get('id')]=$item;
            }    
         }
         return $this->cities_i18n;
     }
}
