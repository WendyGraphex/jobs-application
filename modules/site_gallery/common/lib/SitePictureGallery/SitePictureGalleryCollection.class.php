<?php


class SitePictureGalleryCollection extends orderedObjectCollection {
    
    function __construct($data=null) {
         parent::__construct($data,null);
    }
    
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
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
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSqlQuery();   
    }
   
     protected function executeLastPositionQuery($db)
    {
        $db->setParameter('site_gallery_id',$this->_site_gallery_id);
        $db->setQuery("SELECT max(position) FROM ".$this->getTable()." WHERE site_gallery_id={site_gallery_id} ;")
          ->makeSqlQuery();   
    }
    
    protected function executeUpdatePositionQuery($position,$db)
    {
        $db->setParameter('position',$position)
           ->setQuery("UPDATE ".$this->getTable()." SET position=( SELECT @position:=@position+1 ) WHERE position > {position};")
           ->makeSqlQuery();   
    }
    
     protected function insert()
    {       
        $keys=array();
        // Find keys in collection
        foreach ($this->collection as $item)
        {
            $keys[]=$item->get('gallery_id');
        } 
        // Find last position by key    
        $last_positions=$this->getLastPositionByKeys('gallery_id',$keys);         
        // Update position by key in all item collection     
        foreach ($this->collection as $item)
        {            
            if (is_array($last_positions) && isset($last_positions[$item->get('gallery_id')]))            
            {    
               $item->set('position',++$last_positions[$item->get('gallery_id')]);              
            }  
            else 
            {
                $item->set('position',++$last_positions); 
            }
        }          
        parent::_insert();
    }       
    
    
    
}

