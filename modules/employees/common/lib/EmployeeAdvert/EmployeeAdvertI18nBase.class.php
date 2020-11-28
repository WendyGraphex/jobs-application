<?php

class EmployeeAdvertI18nBase extends mfObjectI18n {
     
    protected static $fields=array('url','reference','is_validated','title','short_description','content','revival_iteration','revival_at','advert_id','lang','number_of_views','number_of_quotations',
                                    'status',
                                    'refused_at','state','published_at','created_at','updated_at');
    const table="t_employee_advert_i18n"; 
    protected static $foreignKeys=array('advert_id'=>'EmployeeAdvert'); // By default
    protected static $fieldsNull=array('updated_at','published_at','state','refused_at','revival_at'); 
    
    function __construct($parameters=null) {       
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;            
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {       
          if (isset($parameters['lang']) && isset($parameters['url'])  && isset($parameters['id']))                
              return $this->loadByLangAndUrlAndId((string)$parameters['lang'],new mfString($parameters['url']),$parameters['id']);          
           if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['advert_id']))
              return $this->loadByLangAndAdvertId((string)$parameters['lang'],(string)$parameters['advert_id']);          
         if (isset($parameters['lang']) && isset($parameters['url']) && $parameters['url'] instanceof mfString)                   
              return $this->loadByLangAndUrl((string)$parameters['lang'],$parameters['url']);    
          if (isset($parameters['lang']) && isset($parameters['title']))
              return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['title']); 
          if (isset($parameters['title']))
              return $this->loadByTitle((string)$parameters['title']); 
          if (isset($parameters['name']))
              return $this->loadByName((string)$parameters['name']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByTitle((string)$parameters);
      }   
    }        
    
     protected function loadByLangAndAdvertId($lang,$advert_id)
    {
       $this->set('advert_id',$advert_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('advert_id'=>$advert_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND advert_id={advert_id};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
   /*  protected function loadByLangAndUrl($lang,mfString $url)
    {                           
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url->urldecode(),"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}';")
            ->makeSqlQuery();        
        return $this->rowtoObject($db);
    }*/
    
     protected function loadByLangAndTitle($lang,$title)
    {
       $this->set('title',$title);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByTitle($title)
    {
       $this->set('title',$title);      
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title))              
            ->setQuery("SELECT * FROM ".self::getTable().                        
                       " WHERE title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByName($name)
    {     
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().  
                       " LEFT JOIN ".self::getOuterForJoin('advert_id').                      
                       " WHERE name='{name}';")
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
            'revival_iteration'=>0,  
            'status'=>'ACTIVE',            
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
            ->setParameters(array("advert_id"=>$this->get('advert_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE advert_id={advert_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
    function delete()
    {
        $this->getAdvert()->set('number_of_languages',($this->getAdvert()->getNumberOfLanguages() > 0 ? $this->getAdvert()->getNumberOfLanguages() - 1:0) )->save();
        $this->set('status','DELETE')->save();
        if (!$this->hasSibbling())
            $this->getAdvert()->delete();
        return $this;
    }
    
      function remove()
    {
        $this->getAdvert()->set('number_of_languages',$this->getAdvert()->getNumberOfLanguages() - 1 )->save();
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getAdvert()->delete();
        return $this;
    } 
   
     function getAdvert()
    {
       return $this->_advert_id=$this->_advert_id===null?new EmployeeAdvert($this->get('advert_id')):$this->_advert_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
   
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeAdvertI18nFormatter($this):$this->formatter;
   }
   
   function hasPublishedAt()
   {
       return (boolean)$this->get('published_at');
   }
   
    function hasRefusedAt()
   {
       return (boolean)$this->get('refused_at');
   }
    
    function setUrl()
   {       
       $this->set('url',(string)mfString::getInstance($this->get('title'))->lower()->makeUrl());    
       return $this;
   }
    
    function process()
    {
        $this->setUrl() ;
        $this->setReference();
        return $this;
    }     
    
     function getUrl()
    {
        return url_i18n_to("employees_advert",array('url'=>$this->get('url'),'id'=>$this->get('id'),'lang'=>$this->get('lang')),"",'frontend');
    }
    
    
    function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }       
    
     function setReference()
    {              
        $parameters=array('{reference}'=>$this->getAdvert()->get('reference'),
                          '{lang}'=>(string)$this->getLanguage()->getCode()->upper(),
                         );        
        $this->set('reference',strtr('{reference}/{lang}',$parameters));
        return $this;
    } 
    
     function publish()
    {
        $this->add(array('published_at'=>date("Y-m-d H:i:s"),'refused_at'=>null))->save();
        return $this;
    }
    
    function refuse()
    {
         $this->add(array('refused_at'=>date("Y-m-d H:i:s"),'published_at'=>null))->save();
        return $this;
    }
    
    function getNumberOfViews()
    {
        return intval($this->get('number_of_views'));
    }
    
    function getNumberOfQuotations()
    {
        return intval($this->get('number_of_quotations'));
    }
       
    function addNumberOfQuotations($value=1)
    {             
        $this->set('number_of_quotations',$this->getNumberOfQuotations() + $value)->save();
        return $this;
    }
    
     function getRevivalIteration()
    {
        return intval($this->get('revival_iteration'));
    }
       
}
