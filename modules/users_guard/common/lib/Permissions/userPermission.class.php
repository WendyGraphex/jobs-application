<?php

class UserPermission extends mfObject2 {
    
     protected static $fields=array('permission_id','user_id');
     protected static $foreignKeys=array('permission_id'=>'Permission','user_id'=>'User');
     
     const table="t_user_permission";    
     
     function __construct($parameters=null) {
        parent::__construct();
        $this->getDefaults();
        if ($parameters === null) return $this;
        if (is_array($parameters)||$parameters instanceof ArrayAccess) {
            if (isset($parameters['id']))
                return $this->loadbyId((string)$parameters['id']);
            return $this->add($parameters);
        }
        else {
            if (is_numeric((string)$parameters))
                $this->loadbyId((string)$parameters);
        }   
    }
    
    protected function executeLoadById($db)
    {
            $db->setQuery("SELECT ".self::getTableKey().",user_id,permission_id 
                       FROM ".self::getTable()."
                       LEFT JOIN ".Permission::getTable()." ON ".Permission::getTableKey()."=".self::getTable().".permission_id
                       WHERE ".self::getTableKey()."=%d;")   
            ->makeSqlQuery(); 
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
    
     function getPermission()
     {
         if (!$this->_permission_id)
         {
             $this->_permission_id=new UserPermission($this->get('permission_id'));
         }   
         return $this->_permission_id;
     }
         
}

