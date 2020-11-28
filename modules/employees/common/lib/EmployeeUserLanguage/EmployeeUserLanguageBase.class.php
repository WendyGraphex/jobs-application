<?php

class EmployeeUserLanguageBase extends OrderedObject {
     
    protected static $fields=array('lang','level_id','employee_user_id','position','created_at','updated_at');
    const table="t_employee_user_language"; 
    protected static $foreignKeys=array('employee_user_id'=>'Employee',                                     
                                        'level_id'=>'EmployeeLanguageLevel'); 
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
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
  
     protected function executeDeleteQuery($db)
    {
         $db->setQuery("DELETE FROM ".self::getTable()." WHERE id=%d;")
                  ->makeSqlQuery();   
    }
    
    protected function executeUpdateQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
          ->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d AND employee_user_id='{employee_user_id}';")
          ->makeSqlQuery();   
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery();   
    }
    
    protected function executeLastPositionQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
            ->setQuery("SELECT max(position) FROM ".static::getTable().";")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
        ->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d AND employee_user_id='{employee_user_id}';")
           ->makeSqlQuery();   
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d AND employee_user_id='{employee_user_id}';")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
         ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND employee_user_id='{employee_user_id}';")
           ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
        ->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position} AND employee_user_id='{employee_user_id}';")
          ->makeSqlQuery();     
    }
    
    protected function executeLoadById($db)
    {
        $db->setParameter('employee_user_id',$this->get('employee_user_id'))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%d' AND employee_user_id='{employee_user_id}';")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));   
    }
        
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
      
    
  /*  protected function executeIsExistQuery($db)    
    {
      
        $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('title'=>$this->get('title'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE title='{title}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();  
    }*/
    
                      
     function getLevel()
    {
       return $this->_level_id=$this->_level_id===null?new EmployeeLanguageLevel($this->get('level_id')):$this->_level_id;                 
    }  
    
     function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    }  
    
    function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }
    
}