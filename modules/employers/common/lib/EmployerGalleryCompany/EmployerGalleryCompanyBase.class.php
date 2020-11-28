<?php

class EmployerGalleryCompanyBase extends mfOrderedObject3 {
     
   
      protected static $fields=array('employer_id','position','gallery_id','created_at','updated_at');    
    const table="t_employer_gallery_company"; 
      protected static $foreignKeys=array('employer_id'=>'EmployerCompany',
                                          'gallery_id'=>'EmployerGallery'); // By default
    
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
    
    
      
    protected function getDefaults()
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
    
    function getEmployerCompany()
    {
       return $this->_employer_companty_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;                 
    }
    function getEmployerUser()
    {
       return $this->_employer_company_id=$this->_employer_company_id===null?new EmployerCompany($this->get('employer_user_id')):$this->_employer_company_id;                 
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
    
      function getEmployer()
    {
       return $this->_employer_id=$this->_employer_id===null?new EmployerCompany($this->get('employer_id')):$this->_employer_id;                 
    }  
    
      function getGallery()
    {
       return $this->_gallery_id=$this->_gallery_id===null?new EmployerGallery($this->get('gallery_id')):$this->_gallery_id;                 
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
    
    
    static function getEmployersFromSelection(mfArray $selection)
    {         
        $list=new EmployerGalleryCompanyCollection();
        if ($selection->isEmpty())
            return $list;    
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())  
                ->setObjects(array('EmployerCompany'))
                ->setQuery("SELECT {fields} FROM ".EmployerCompany::getTable().                           
                           " WHERE ".EmployerCompany::getTableField('id')." IN('".$selection->implode("','")."')".                          
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                            
             $item=new EmployerGalleryCompany();
             $item->set('employer_id',$items->getEmployerCompany());   
             $item->set('position',$selection->find($item->get('employer_id')) +1);
             $list[$item->get('employer_id')]=$item;
        }                      
        return $list;     
    }
}
