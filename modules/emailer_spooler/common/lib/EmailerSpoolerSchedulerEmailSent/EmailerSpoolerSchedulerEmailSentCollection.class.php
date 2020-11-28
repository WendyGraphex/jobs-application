<?php


class EmailerSpoolerSchedulerEmailSentCollection extends mfObjectCollection2 {
    
    
     function __construct($data=null) {
         parent::__construct($data);
     }
     
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuerySuperAdmin();
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSqlQuerySuperAdmin(); 
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuerySuperAdmin();
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuerySuperAdmin();
    }
    
    
   
    
}

