<?php

class ProjectTaskStateI18nBase extends mfObjectI18n {
     
    protected static $fields=array('value','state_id','lang','created_at','updated_at');
    const table="t_project_task_state_i18n"; 
    protected static $foreignKeys=array('state_id'=>'ProjectTaskState'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['state_id']))
              return $this->loadByLangAndStateId((string)$parameters['lang'],(string)$parameters['state_id']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['value']))
              return $this->loadByLangAndValue((string)$parameters['lang'],(string)$parameters['value']); 
          if (isset($parameters['value']))
              return $this->loadByValue((string)$parameters['value']); 
          if (isset($parameters['name']))
              return $this->loadByName((string)$parameters['name']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByEmail((string)$parameters);
      }   
    }
    
  /*  protected function loadByEmail($email)
    {
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()->setParameters(array($email));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }*/
    
     protected function loadByLangAndStateId($lang,$state_id)
    {
       $this->set('state_id',$state_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('state_id'=>$state_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND state_id={state_id};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByLangAndValue($lang,$value)
    {
       $this->set('value',$value);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('value'=>$value,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND value='{value}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByValue($value)
    {
       $this->set('value',$value);      
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('value'=>$value))              
            ->setQuery("SELECT * FROM ".self::getTable().                        
                       " WHERE value='{value}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByName($name)
    {     
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().  
                       " LEFT JOIN ".self::getOuterForJoin('state_id').                      
                       " WHERE name='{name}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");      
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
      $db->setParameters(array('value'=>$this->get('value'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE value='{value}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();   
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("state_id"=>$this->get('state_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE state_id={state_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getState()->delete();
        return $this;
    }  
   
     function getState()
    {
       if (!$this->_state_id)
       {
          $this->_state_id=new ProjectTaskState($this->get('state_id'),$this->getSite());          
       }   
       return $this->_state_id;
    }    
    
    
     public function getNameForIcon($default="")
    {
       return preg_replace('/[^a-z0-9]/iu','', $this->get('value')).$default; 
    }  
   
    function __toString() {
        return (string)$this->get('value');
    }
}
