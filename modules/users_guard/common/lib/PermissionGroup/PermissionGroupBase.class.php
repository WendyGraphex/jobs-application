<?php

class PermissionGroupBase extends mfObject2 {
    
    protected static $fields=array('name');
    const table="t_permission_group"; 
   
    
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
                return $this->loadbyId((string)$parameters);
            return $this->loadByName((string)$parameters);
                    
        }
    }
    
     protected function loadByName($name)
    {
       $this->set('name',$name);       
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE name='{name}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function executeDeleteQuery($db)
     {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;") 
          ->makeSqlQuery();
     }
    
     protected function executeInsertQuery($db)
     {
       $db->makeSqlQuery();;   
     }
    
     protected function executeUpdateQuery($db)
     {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
         ->makeSqlQuery(); 
     }
    
     protected function executeLoadById($db) 
     {
         $db->setQuery("SELECT * FROM ".self::getTable()."                       
                        WHERE ".self::getTableKey()."=%d;")               
          ->makeSqlQuery();
     }
     
   
     
     protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();      
    }
    
    function addPermission($permission)
    {
        $this->permissions[]=$permission;
        return $this;
    }
    
    function getPermissions()
    {
        return $this->permissions;
    }
    
    function getSortedPermissions()
    {
        $values=array();
        foreach ($this->permissions as $permission)
           $values[__($permission->get('name'),'','permissions')]=$permission;
        ksort($values);
        return $values;
    }
    
    function hasPermissions()
    {
        return !empty($this->permissions);
    }
    
    function setPermissionGroupI18n($permission_group_i18n)
    {
        $this->permission_group_i18n=$permission_group_i18n;
        return $this;
    }
    
    function getPermissionGroupI18n($lang=null)
    {
        if (!$this->permission_group_i18n)
        {
            if ($lang==null)
                $lang=mfContext::getInstance()->getUser()->getCountry();
            $this->permission_group_i18n=new PermissionGroupI18n(array('lang'=>$lang,'group_id'=>$this->get('id')));
        }    
        return $this->permission_group_i18n;
    }
}

