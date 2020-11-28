<?php

class userPermissionCollection extends mfObjectCollection2 {
        
    function __construct($data=null) {
        parent::__construct($data);
    }
    
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT ".$this->getTableKey().",user_id FROM ".$this->getTable().
                      " LEFT JOIN ".Permission::getTable()." ON ".Permission::getTableKey()."=permission_id".
                      " WHERE ".$this->getWhereConditions().";")
                     // " WHERE ".$this->getWhereConditions()." AND application@@IN_APPLICATION@@;")
           ->makeSqlQuery();     
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSqlQuery();   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();   
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
            ->makeSqlQuery(); 
    }
    
}

