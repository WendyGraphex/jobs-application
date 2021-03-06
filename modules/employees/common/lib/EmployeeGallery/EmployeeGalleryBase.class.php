<?php


class EmployeeGalleryBase extends mfObject3 {
     
    protected static $fields=array('name','tpl','is_active','number_of_items','created_at','updated_at');    
    const table="t_employee_gallery"; 
     

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
            'is_active'=>'YES'
        )); 
    }     
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
         
    protected function executeIsExistQuery($db)    
    {
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSqlQuery();       
    }
        
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->get('updated_at'));
    }
    
    
     function hasI18n()
    {
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new EmployeeGalleryI18n(array('lang'=>$lang,"gallery_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     }         
    
    function hasEmployees()
     {
         return (boolean)$this->number_of_items;
     }
     
     function getNumberOfEmployees()
     {
         return new IntegerFormatter($this->number_of_items);      
     }
         
      function updateEmployees(EmployeeGalleryEmployeeCollection $selection)
     {                           
         $db=mfSiteDatabase::getInstance() ;
        if ($selection->isEmpty())
        {
            $db->setParameters(array('gallery_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeGalleryEmployee::getTable().                            
                           " WHERE ".EmployeeGalleryEmployee::getTableField('gallery_id')."='{gallery_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            $this->set('number_of_items',0)->save();
            return $this;
        }   
                 
         $db->setParameters(array('gallery_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeGalleryEmployee::getTable().                            
                           " WHERE ".EmployeeGalleryEmployee::getTableField('gallery_id')."='{gallery_id}' AND employee_user_id NOT IN('".$selection->getEmployees()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
               
        $collection = new EmployeeGalleryEmployeeCollection();
        $db->setParameters(array('gallery_id'=>$this->get('id')))              
           ->setQuery("SELECT * FROM ".EmployeeGalleryEmployee::getTable().                            
                           " WHERE ".EmployeeGalleryEmployee::getTableField('gallery_id')."='{gallery_id}'".  
                         //  " ORDER BY position ASC ".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
            while ($item=$db->fetchObject('EmployeeGalleryEmployee'))
            {        
               $collection[$item->get('employee_id')]=$item->loaded();
            } 
            $collection->loaded();
         }            
                 
       //  var_dump($collection->getKeys()->toArray());
         // create & update
          foreach ($selection as $employee_gallery)
         {
             if (isset($collection[$employee_gallery->get('employee_id')]))
             {
                $collection[$employee_gallery->get('employee_id')]->set('position',$employee_gallery->get('position'));
             }   
             else
             {               
                $collection[]=$employee_gallery->set('gallery_id',$this);
             }
         }                      
        $collection->save();
        $this->set('number_of_items',$collection->count())->save();
        return $this;      
     }
     
     
     function getGalleryEmployees()
     {
         if ($this->gallery_employees===null)
         {
             $this->gallery_employees = new EmployeeGalleryEmployeeCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("gallery_id"=>$this->get('id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('Employee','EmployeeGalleryEmployee'))
                    ->setQuery("SELECT {fields} FROM ".EmployeeGalleryEmployee::getTable().                              
                               " INNER JOIN ".EmployeeGalleryEmployee::getOuterForJoin('employee_user_id').                               
                               " WHERE gallery_id={gallery_id}".
                               " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->gallery_employees;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployeeGalleryEmployee();   
               $item->set('employee_id',$items->getEmployee());             
               $this->gallery_employees[$item->get('id')]=$item;
            }    
         }
         return $this->gallery_employees;
     }
     
     function updatePositions(mfArray $positions)
     {
          if ($positions->isEmpty())
            return ;
         $db=mfSiteDatabase::getInstance();
         foreach ($positions as $position=>$id)
         {    
                $db->setParameters(array('position'=>$position+1,'id'=>$id,'gallery_id'=>$this->get('id')))
                   ->setQuery("UPDATE ". EmployeeGalleryEmployee::getTable()." SET position={position}".
                              " WHERE id={id} AND gallery_id='{gallery_id}'".                    
                              ";")               
                ->makeSqlQuery(); 
         }                
         // Renumbering the rest if exists
         $db->setQuery("SELECT @position:=".$positions->count().";")
              ->makeSqlQuery();        
         $db->setParameters(array('gallery_id'=>$this->get('id')))
            ->setQuery("UPDATE ".EmployeeGalleryEmployee::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id NOT IN('".$positions->implode("','")."')".
                            " AND gallery_id='{gallery_id}'".
                      " ORDER BY position;")
           ->makeSqlQuery();                      
         return $this;
     } 
     
     
       function getEmployees()
     {
         if ($this->employees===null)
         {
             $this->employees = new EmployeeCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("gallery_id"=>$this->get('id')))  
                    ->setObjects(array('Employee'))
                    ->setQuery("SELECT {fields} FROM ".EmployeeGalleryEmployee::getTable().                              
                               " INNER JOIN ".EmployeeGalleryEmployee::getOuterForJoin('employee_user_id').                            
                               " WHERE gallery_id='{gallery_id}'".
                               " ORDER BY ".EmployeeGalleryEmployee::getTableField('position')." ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->employees;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getEmployee();                          
               $this->employees[$item->get('id')]=$item;
            }    
         }
         return $this->employees;
     } 
     
        function getTemplate()
     {
         return $this->get('tpl')?$this->get('tpl'):'default';
     }
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeGalleryFormatter($this):$this->formatter;
   }
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}
