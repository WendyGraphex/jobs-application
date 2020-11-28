<?php

 
class SocialNetworkCollection extends orderedObjectCollection {
    
    function __construct($data=null,$site=null)
    {        
      parent::__construct($data,null,$site);
    }
    
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
           ->makeSiteSqlQuery($this->site);   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSiteSqlQuery($this->site);   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSiteSqlQuery($this->site);   
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSiteSqlQuery($this->site);   
    }
    
    protected function executeLastPositionQuery($db)
    {
        $db->setQuery("SELECT max(position) FROM ".$this->getTable()." ;")
           ->makeSiteSqlQuery($this->site);   
    }
          
    protected function executeUpdatePositionQuery($position,$db)
    {
        $db->setParameter('position',$position)
           ->setQuery("UPDATE ".$this->getTable()." SET position=( SELECT @position:=@position+1 ) WHERE position > {position};")
           ->makeSiteSqlQuery($this->site);
    }
    
    function toArray()
    {
        $values=array();
        foreach ($this as $item)
        {
            $values[]=$item->toArray();
        }    
        return $values;
    }
}

