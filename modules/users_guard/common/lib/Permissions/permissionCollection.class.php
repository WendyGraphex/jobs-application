<?php


class permissionCollection extends mfObjectCollection2 {
    
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions()." AND application@@IN_APPLICATION@@;")
           ->makeSqlQuery($this->application);   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions()." AND application@@IN_APPLICATION@@;")
          ->makeSqlQuery($this->application);   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery($this->application);   
    }            
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery($this->application); 
    }
}

