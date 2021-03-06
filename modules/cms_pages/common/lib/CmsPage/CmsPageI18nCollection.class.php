<?php

class CmsPageI18nCollection extends mfObjectCollection2 {   
    
    function __construct($data=null,$site=null) {
        parent::__construct($data, null, $site);
    }
    
     protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery(); ;   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSqlQuery(); ;   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery(); ;   
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery(); ;   
    }
        
}

