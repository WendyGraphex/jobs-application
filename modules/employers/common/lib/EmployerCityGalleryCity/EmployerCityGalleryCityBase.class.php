<?php

class EmployerCityGalleryCityBase extends mfOrderedObject3 {
     
   
      protected static $fields=array('city_id','is_small','position','gallery_id','created_at','updated_at');    
    const table="t_employer_city_gallery_city"; 
      protected static $foreignKeys=array('city_id'=>'EmployerCity',
                                          'gallery_id'=>'EmployerCityGallery'); // By default
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"), 
            'is_small'=>'NO'
        ));        
        parent::getDefaults();
    }
     
   
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
       
    
    protected function executeIsExistQuery($db)    
    {    
       $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable().                    
                    " WHERE name='{name}' AND name!='' ".($this->getKey()?" AND ".self::getKeyName()."!='%s';":""))
         ->makeSqlQuery();       
    }        
   
      protected function executeLastPositionQuery($db)
    {
     $db->setParameter('gallery_id',$this->get('gallery_id'))
        ->setQuery("SELECT max(position) FROM ".static::getTable()." WHERE gallery_id='{gallery_id}';")
        ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
       $db->setParameter('gallery_id',$this->get('gallery_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d AND gallery_id='{gallery_id}';")
           ->makeSqlQuery();   
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setParameter('gallery_id',$this->get('gallery_id'))
           ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d AND gallery_id='{gallery_id}';")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
      $db->setParameter('gallery_id',$this->get('gallery_id'))
           ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND gallery_id='{gallery_id}';")
           ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setParameter('gallery_id',$this->get('gallery_id'))
          ->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position} AND gallery_id='{gallery_id}' ;")
          ->makeSqlQuery();     
    }
    
      function getGallery()
    {
       return $this->_gallery_id=$this->_gallery_id===null?new EmployerCityGallery($this->get('gallery_id')):$this->_gallery_id;                 
    }  
    
      function getCity()
    {
       return $this->_city_id=$this->_city_id===null?new EmployerCity($this->get('city_id')):$this->_city_id;                 
    }  
    
       function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->get('updated_at'));
    }
       
    static  function updatePositions(mfArray $positions)
    {
         if ($positions->isEmpty())
            return ;
         $db=mfSiteDatabase::getInstance();
         foreach ($positions as $position=>$id)
         {    
                $db->setParameters(array('position'=>$position+1,'id'=>$id,'gallery_id'=>$this->get('gallery_id')))
                   ->setQuery("UPDATE ".self::getTable()." SET position={position}".
                              " WHERE id={id} AND gallery_id='{gallery_id}'".                    
                              ";")               
                ->makeSqlQuery(); 
         }                
         // Renumbering the rest if exists
         $db->setQuery("SELECT @position:=".$positions->count().";")
              ->makeSqlQuery();        
         $db->setParameters(array('gallery_id'=>$this->get('gallery_id')))
            ->setQuery("UPDATE ".self::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id NOT IN('".$positions->implode("','")."')".
                            " AND gallery_id='{gallery_id}'".
                      " ORDER BY position;")
           ->makeSqlQuery();   
         return $this;       
    }
    
     static function getCitiesFromSelection(mfArray $selection)
    {         
        $list=new EmployerCityGalleryCityCollection();
        if ($selection->isEmpty())
            return $list;    
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())  
                ->setObjects(array('EmployerCity'))
                ->setQuery("SELECT {fields} FROM ".EmployerCity::getTable().                           
                           " WHERE ".EmployerCity::getTableField('id')." IN('".$selection->implode("','")."')".                          
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                            
             $item=new EmployerCityGalleryCity();
             $item->set('city_id',$items->getEmployerCity());   
             $item->set('position',$selection->find($item->get('city_id')) +1);
             $list[$item->get('city_id')]=$item;
        }                      
        return $list;     
    }
}
