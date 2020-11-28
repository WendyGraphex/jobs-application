<?php

class EmployeeGalleryEmployeeBase extends mfOrderedObject3 {
     
   
      protected static $fields=array('employee_user_id','position','gallery_id','created_at','updated_at');    
      const table="t_employee_gallery_employee"; 
      protected static $foreignKeys=array('employee_user_id'=>'Employee',
                                          'gallery_id'=>'EmployeeGallery'); // By default
    
      
      function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                    
          return $this->add($parameters); 
      }
      else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
         
        } 
    }   
    
    
    function getDefaults()
    {      
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),                        
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
    
      function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    }  
    
      function getGallery()
    {
       return $this->_gallery_id=$this->_gallery_id===null?new EmployeeGallery($this->get('gallery_id')):$this->_gallery_id;                 
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
    
    
    static function getEmployeesFromSelection(mfArray $selection)
    {         
        $list=new EmployeeGalleryEmployeeCollection();
        if ($selection->isEmpty())
            return $list;    
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())  
                ->setObjects(array('Employee'))
                ->setQuery("SELECT {fields} FROM ".Employee::getTable().                           
                           " WHERE ".Employee::getTableField('id')." IN('".$selection->implode("','")."')".                          
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;     
        while ($items=$db->fetchObjects())
        {                            
             $item=new EmployeeGalleryEmployee();            
             $item->set('employee_user_id',$items->getEmployee());   
             $item->set('position',$selection->find($item->get('employee_user_id')) +1);
             $list[$item->get('employee_user_id')]=$item;
        }                      
        return $list;     
    }
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeGalleryEmployeeFormatter($this):$this->formatter;
   }
}
