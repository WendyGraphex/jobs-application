<?php

class siteCollection extends mfObjectCollection2 {   

    function __construct($data=null) {
        parent::__construct($data, null, $site);
    }
    
    protected function executeSelectQuery($db)
    {
      $db->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")         
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
         die(__METHOD__);
      // $db->makeSqlQuerySuperAdmin(); 
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuerySuperAdmin();  
    }
            
}

