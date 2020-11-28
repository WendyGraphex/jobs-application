<?php

class cmsBlockBase extends mfObject2 {
   
 
    protected static $fields=array('name'); //,'created_at','updated_at');
    
    const table="t_site_cms_blocks";
    
    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
           if (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']);
           return $this->add($parameters); 
       }  
       else 
       {    
          if (is_numeric((string)$parameters)) 
             $this->loadById((string)$parameters);   
          else
             $this->loadByName((string)$parameters);    
       } 
    }

    protected function loadByName($name)
    {
        $db=mfSiteDatabase::getInstance()
            ->setParameters($name)
            ->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")  
            ->makeSqlQuery(); ; 
        return $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery(); ;  
    }
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery(); ;   
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate()." WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery(); ; 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuery(); ;   
    }
    
    
    /* **************** M E T H O D S ******************************************************************* */
    function getPageI18nBlockCollection($lang)
    {
        return new CmsPageI18nBlockCollection(array("lang"=>$lang,"id"=>$this->getKey()),$this->getSite());
    }
    
  
    
    
}

