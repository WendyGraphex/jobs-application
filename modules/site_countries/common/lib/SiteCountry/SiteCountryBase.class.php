<?php

class SiteCountryBase extends  mfObject3  {

    protected static $fields=array('code','is_active','created_at','updated_at');
    const table="t_site_country";
            
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
            if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
            if (isset($parameters['lang']) && isset($parameters['title']))
               return $this->loadByLangAndTitle($parameters['lang'],$parameters['title']);
            $this->add($parameters); 
       }  
       else
       {
           if (is_numeric((string)$parameters)) 
                $this->loadById((string)$parameters);             
           else
               $this->loadByCode((string)$parameters);             
       } 
    }
    
     protected function loadByLangAndTitle($lang,$title)
    {      
         $db=mfSiteDatabase::getInstance()->setParameters(array('lang'=>$lang,'title'=>$title));
         $db->setQuery("SELECT ".self::getFieldsAndKeyWithTable().                       
                       " FROM ".SiteCountry::getTable().
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".self::getTableField('code').
                       " WHERE title='{title}' AND lang='{lang}' LIMIT 1;")
            ->makeSqlQuery();           
         return $this->rowtoObject($db);
    } 
    
    
    protected function loadByCode($code)
    {
        $this->set('code',$code);
         $db=mfSiteDatabase::getInstance()->setParameters(array($code));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE code='%s' LIMIT 1;")
            ->makeSqlQuery();  
         return $this->rowtoObject($db);
    }
    
    

    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }
   
    
    
    protected function getDefaults()
    {
         $this->created_at=date("Y-m-d H:i:s");  
         $this->updated_at=date("Y-m-d H:i:s");
         $this->is_active=isset($this->is_active)?$this->is_active:"YES";
    }
    
   
    function __toString()
    {
        return (string)new CountryFormatter($this->get('code')); 
    }
    
    public function getI18n()
    {
        return format_country($this->get('code'));
    }
    
    function create(mfArray $selection)
    {
        $db=mfSiteDatabase::getInstance();
         if ($selection->isEmpty())
         {   
             $db->setParameters(array())
                ->setQuery("DELETE FROM ".SiteCountry::getTable().                                                 
                           ";")               
                ->makeSqlQuery(); 
             return $this;      
         }    
        // DELETE
        $db->setParameters(array())
                ->setQuery("DELETE FROM ".SiteCountry::getTable().                         
                           " WHERE ".SiteCountry::getTableField('code')." NOT IN('".$selection->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        // UPDATE / CREATE       
        $db->setParameters(array())
                ->setQuery("SELECT code FROM ".SiteCountry::getTable().                         
                           " WHERE ".SiteCountry::getTableField('code')." IN('".$selection->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {   
            while ($row=$db->fetchArray())
            {
               $selection->findAndRemove($row['code']);
            }
         }
         $collection=new SiteCountryCollection();       
        foreach ($selection as $code)
        {
            $item=new SiteCountry();
            $item->add(array('code'=>$code));
            $collection[]=$item;
        }
        $collection->save();          
        return $this;
    }
    
    static function getCountriesByCodeForSelect()
    {
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())                 
                ->setQuery("SELECT code FROM ".self::getTable().";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($row=$db->fetchArray())
        {                            
           $list[$row['code']]=$row['code'];
        }                
        return $list;                                    
    }
    
    
    static function getActiveCountriesI18nByCodeForSelect()
    {
        static $list=null;
        
        if ($list===null)
        {
            $list=new mfArray();
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())                 
                ->setQuery("SELECT code FROM ".self::getTable().
                           " WHERE is_active='YES'".
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
            if (!$db->getNumRows())
                return $list;             
            while ($row=$db->fetchArray())
            {                            
               $list[$row['code']]=ucfirst(format_country($row['code']));
            }                
            $list->asort();
        }
        return $list;                                    
    }
    
    static function getActiveCountriesI18nForSelect()
    {
        static $list=null;
        
        if ($list===null)
        {
            $list=new mfArray();
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())                 
                ->setQuery("SELECT id,code FROM ".self::getTable().
                           " WHERE is_active='YES'".
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
            if (!$db->getNumRows())
                return $list;             
            while ($row=$db->fetchArray())
            {                            
               $list[$row['id']]=ucfirst(format_country($row['code']));
            }                
            $list->asort();
        }
        return $list;                                    
    }
    
      function getCode()
    {
       return new CountryFormatter($this->get('code')) ;
    }
    
    
       function getFormatter()
    {
       return new CountryFormatter($this->get('code')) ;
    }
    
    
    function getLanguages()
    {
       // if ($this->languages===null)
       // {
            $this->languages=new LanguageCollection();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('country_id'=>$this->get('id')))
                ->setQuery("SELECT ".Language::getFieldsAndKeyWithTable()." FROM ".Language::getTable().  
                           " INNER JOIN ".SiteCountryLanguage::getInnerForJoin('language_id').
                           " WHERE country_id='{country_id}'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
          return $this->languages;
        while ($item=$db->fetchObject('Language'))
        {
          $this->languages[$item->get('id')]=$item->loaded();
        }     
      //  $this->languages->sortByCountry();
       // }
        return $this->languages;
    }
    
    function addLanguages(mfArray $selection)
    {     
        $db=mfSiteDatabase::getInstance();                
         if ($selection->isEmpty())
         {   
             $db->setParameters(array('country_id'=>$this->get('id')))
                ->setQuery("DELETE FROM ".SiteCountryLanguage::getTable()." WHERE country_id='{country_id}'".                            
                           ";")               
                ->makeSqlQuery(); 
             return $this;      
         }  
          $db->setParameters(array('country_id'=>$this->get('id')))
                ->setQuery("DELETE FROM ".SiteCountryLanguage::getTable().                                                   
                           " WHERE country_id='{country_id}' AND ".SiteCountryLanguage::getTableField('language_id')." NOT IN('".$selection->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        // UPDATE / CREATE       
        $db->setParameters(array('country_id'=>$this->get('id')))
                ->setQuery("SELECT language_id FROM ".SiteCountryLanguage::getTable().                         
                           " WHERE country_id='{country_id}' AND ".SiteCountryLanguage::getTableField('language_id')." IN('".$selection->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {   
            while ($row=$db->fetchArray())
            {               
               $selection->findAndRemove($row['language_id']);
            }
         }             
        $collection=new SiteCountryLanguageCollection();       
        foreach ($selection as $id)
        {
            $item=new SiteCountryLanguage();
            $item->add(array('country_id'=>$this,'language_id'=>$id));
            $collection[]=$item;
        }
        $collection->save();    
        return $this;
    }
    
    function hasLanguages()
    {
        return !$this->getLanguages()->isEmpty();
    } 
    
   
    
    function addLanguage(Language $language)
    {
        if (!$language)
            return $this;
        if ($language->isNotLoaded())
            return $this;
        if ($this->languages===null)
            $this->languages=new LanguageCollection ();
        if (isset($this->languages[$language->get('id')]))
            return $this;
        $this->languages[$language->get('id')]=$language;        
        return $this;
    }
    
    
    static function getLanguagesByCountries()
    {        
        $list=new SiteCountryCollection();
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setObjects(array('Language','SiteCountry'))
                ->setQuery("SELECT {fields} FROM ".Language::getTable().  
                           " INNER JOIN ".SiteCountryLanguage::getInnerForJoin('language_id').
                           " INNER JOIN ".SiteCountryLanguage::getOuterForJoin('country_id').
                         //  " WHERE ".SiteCountry::getTableField('is_active')."='YES' AND ".
                         //           SiteLanguage::getTabledField('is_active')."='YES' ".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;
        while ($items=$db->fetchObjects())
        {
             if (!isset($list[$items->getSiteCountry()->get('id')]))
                 $list[$items->getSiteCountry()->get('id')]=$items->getSiteCountry();
             $list[$items->getSiteCountry()->get('id')]->addLanguage($items->getLanguage());
        }
        return $list;        
    }
}


