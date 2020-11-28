<?php

class SiteClientCollection extends  mfObjectCollection2 {
    
       
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery($this->application,$this->site);   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSqlQuery($this->application,$this->site);   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery($this->application,$this->site);   
    } 
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery($this->application,$this->site); 
    }
    
    
}

