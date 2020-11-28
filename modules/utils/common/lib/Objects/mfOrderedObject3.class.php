<?php


class mfOrderedObject3 extends OrderedObject {
     
    
     protected function executeDeleteQuery($db)
    {
         $db->setQuery("DELETE FROM ".self::getTable()." WHERE id=%d;")
                  ->makeSqlQuery();   
    }

    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE id=%d LIMIT 1;")
            ->makeSqlQuery();  
    }
   
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery();   
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery();   
    }
    
    protected function executeLastPositionQuery($db)
    {
     $db->setQuery("SELECT max(position) FROM ".static::getTable().";")
        ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
       $db->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d;")
           ->makeSqlQuery();   
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d;")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d;")
           ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position};")
          ->makeSqlQuery();     
    }
    
    static function executeLastQuery($db)
    {
       $db->setQuery("SELECT max(position) FROM ".static::getTable().";")
          ->makeSqlQuery();     
    }
    
       
    static  function updatePositions(mfArray $positions)
    {
         if ($positions->isEmpty())
            return ;
         $db=mfSiteDatabase::getInstance();
         foreach ($positions as $position=>$id)
         {    
                $db->setParameters(array('position'=>$position+1,'id'=>$id))
                   ->setQuery("UPDATE ".self::getTable()." SET position={position}".
                              " WHERE id={id}".                       
                              ";")               
                ->makeSqlQuery(); 
         }                
         // Renumbering the rest if exists
         $db->setQuery("SELECT @position:=".$positions->count().";")
              ->makeSqlQuery();        
         $db->setParameters()
            ->setQuery("UPDATE ".self::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id NOT IN('".$positions->implode("','")."')".
                      " ORDER BY position;")
           ->makeSqlQuery();   
         return $this;       
    }
    
    
    
}
