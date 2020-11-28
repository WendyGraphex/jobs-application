<?php

class UserGroup extends mfObject2 {
    
    protected static $fields=array('user_id','group_id','is_active');
    const table="t_user_group";    
    protected static $foreignKeys=array('user_id'=>'User','group_id'=>'Group');
    
    function __construct($parameters=null, $site=null) {
        parent::__construct(null, $site);
        $this->getDefaults();
        if ($parameters === null) return $this;
        if (is_array($parameters)) {
            if (isset($parameters['id']))
                return $this->loadbyId($parameters['id']);
            return $this->add($parameters);
        }
        else {
            if (is_numeric($parameters))
                return $this->loadbyId($parameters);
          //  return $this->loadbyName((string)$parameters); 
        }
    }
      
   /* protected function loadByName($name)
    {
         $this->set('name',$name);
         $db=mfSiteDatabase::getInstance()->setParameters(array($name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s' AND application@@IN_APPLICATION@@;")
             ->makeSqlQuery($this->application,$this->site);                          
         return $this->rowtoObject($db);
    }*/
    
     protected function executeLoadById($db)
    {
         $db->setQuery("SELECT  ".self::getFieldsAndKeyWithTable()."  FROM ".self::getTable().
                       " LEFT JOIN ".User::getTable()." ON ".User::getTableKey()."=user_id".
                       " WHERE ".self::getTableKey()."=%d;")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
       $this->is_active=isset($this->is_active)?$this->is_active:"NO";
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();   
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
     
}

