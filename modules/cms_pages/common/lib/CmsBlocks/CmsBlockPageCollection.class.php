<?php

class cmsBlockPageCollection extends orderedObjectCollection {   
    
    function __construct($data=null) {
        parent::__construct($data);
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
    
    protected function insert()
    {       
        $keys=array();
        // Find keys in collection
        foreach ($this->collection as $item)
        {
            $keys[]=$item->get('block_id');
        } 
        // Find last position by key    
        $last_positions=$this->getLastPositionByKeys('block_id',$keys);         
        // Update position by key in all item collection     
        foreach ($this->collection as $item)
        {            
            if (is_array($last_positions) && isset($last_positions[$item->get('block_id')]))            
            {    
               $item->set('position',++$last_positions[$item->get('block_id')]);              
            }  
            else 
            {
                $item->set('position',++$last_positions); 
            }
        }      
        parent::_insert();
    }        

    // A remettre dans la class orderedCollection
    protected function getLastPositionByKeys($name,$keys)
    {
        $db=mfSiteDatabase::getInstance()
          ->setQuery("SELECT ".$name.",max(position) as max FROM ".$this->getTable()." WHERE ".$name." IN('".implode("','",$keys)."');")
          ->makeSqlQuery(); ;         
        $positions=array();
        while ($row=$db->fetchArray())
        {        
            if ($row['max']==null) // case is no row in table
                return 0;
            $positions[$row[$name]]=$row['max'];
        }        
        return $positions;
    }
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery(); ;   
    }
    
    protected function executeLastPositionQuery($db)
    {
        $db->setParameter('block_id',$this->_block_id);
        $db->setQuery("SELECT max(position) FROM ".$this->getTable()." WHERE block_id={block_id} ;")
          ->makeSqlQuery(); ;   
    }
    
    protected function executeUpdatePositionQuery($position,$db)
    {
        $db->setParameter('position',$position)
           ->setQuery("UPDATE ".$this->getTable()." SET position=( SELECT @position:=@position+1 ) WHERE position > {position};")
           ->makeSqlQuery(); ;   
    }
}

