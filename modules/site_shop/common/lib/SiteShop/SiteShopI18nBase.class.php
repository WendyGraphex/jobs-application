<?php


class SiteShopI18nBase extends mfObjectI18n {
     
    protected static $fields=array('meta_title','meta_keywords','meta_description','meta_author','shop_id','lang','created_at','updated_at');
    const table="t_site_shop_i18n"; 
    protected static $foreignKeys=array('shop_id'=>'SiteShop'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['shop_id']))
              return $this->loadByLangAndShopId((string)$parameters['lang'],(string)$parameters['shop_id']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['meta_title']))
              return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['meta_title']); 
          if (isset($parameters['lang']))
              return $this->loadByLang((string)$parameters['lang']); 
          if (isset($parameters['meta_title']))
              return $this->loadByTitle((string)$parameters['meta_title']);          
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByTitle((string)$parameters);
      }   
    }   
    
     protected function loadByLang($lang)
    {  
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' LIMIT 0,1;")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByLangAndShopId($lang,$shop_id)
    {
       $this->set('shop_id',$shop_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('shop_id'=>$shop_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND shop_id={shop_id};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByLangAndTitle($lang,$meta_title)
    {
       $this->set('meta_title',$meta_title);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('meta_title'=>$meta_title,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND meta_title='{meta_title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByTitle($meta_title)
    {
       $this->set('meta_title',$meta_title);      
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('meta_title'=>$meta_title))              
            ->setQuery("SELECT * FROM ".self::getTable().                        
                       " WHERE meta_title='{meta_title}';")
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
      $key_condition=$this->getKey()?" AND ".self::getKeyName()."!='%s'":"";
      $db->setParameters(array('lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE lang='{lang}' ".$key_condition.";")
         ->makeSqlQuery();           
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("shop_id"=>$this->get('shop_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE shop_id={shop_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getShop()->delete();
        return $this;
    }  
   
     function getShop()
    {
       return $this->_shop_id=$this->_shop_id===null?new SiteShop($this->get('shop_id')):$this->_shop_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('meta_title');
    }
    
    function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }
    
}
