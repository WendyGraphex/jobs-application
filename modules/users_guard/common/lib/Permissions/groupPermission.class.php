<?php

class GroupPermission extends mfObject2 {
    
    protected static $fields=array('permission_id','group_id');
    const table="t_group_permission"; 
    protected static $foreignKeys=array('permission_id'=>'Permission','group_id'=>'Group');
    
    function __construct($parameters=null) {
        parent::__construct();
        $this->getDefaults();
        if ($parameters === null) return $this;
        if (is_array($parameters)||$parameters instanceof ArrayAccess) {
            if (isset($parameters['id']))
                return $this->loadbyId((string)$parameters['id']);
            if (isset($parameters['group_id']) && isset($parameters['permission_id']))
                return $this->loadbyGroupIdAndPermissionId((string)$parameters['group_id'],(string)$parameters['permission_id']);
            return $this->add($parameters);
        }
        else {
            if (is_numeric((string)$parameters))
                $this->loadbyId((string)$parameters);
        }
    }
    
     protected function loadbyGroupIdAndPermissionId($group_id,$permission_id)
    {
       $this->set('group_id',$group_id);     
       $this->set('permission_id',$permission_id);  
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('permission_id'=>$permission_id,'group_id'=>$group_id))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE group_id='{group_id}' AND permission_id='{permission_id}';")
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
       $db->makeSqlQuery(); 
     }
    
     protected function executeUpdateQuery($db)
     {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery(); 
     }
    
     protected function executeLoadById($db) 
     {
         $db->setQuery("SELECT ".self::getTableKey().",t_group_permission.group_id,permission_id ".
                       " FROM ".self::getTable().
                       " LEFT JOIN ".Permission::getTable()." ON ".Permission::getTableKey()."=".self::getTable().".permission_id ".
                       " WHERE ".self::getTableKey()."=%d;")               
                     //   WHERE ".self::getTableKey()."=%d AND t_permissions.application@@IN_APPLICATION@@;")               
          ->makeSqlQuery(); 
     }
     
     function getPermission()
     {
         if (!$this->_permission_id)
         {
             $this->_permission_id=new GroupPermission($this->get('permission_id'));
         }   
         return $this->_permission_id;
     }
}

