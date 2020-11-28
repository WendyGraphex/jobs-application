<?php

class EmployerUserLanguageBase extends OrderedObject {
     
    protected static $fields=array('lang','level_id','employer_user_id','position','created_at','updated_at');
    const table="t_employer_user_language"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',                                     
                                        'level_id'=>'EmployerLanguageLevel'); 
    
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
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
          ->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d AND employer_user_id='{employer_user_id}';")
          ->makeSqlQuery();   
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery();   
    }
    
    protected function executeLastPositionQuery($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
            ->setQuery("SELECT max(position) FROM ".static::getTable().";")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftUpQuery($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
        ->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d AND employer_user_id='{employer_user_id}';")
           ->makeSqlQuery();   
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d AND employer_user_id='{employer_user_id}';")
            ->makeSqlQuery(); 
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
         ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND employer_user_id='{employer_user_id}';")
           ->makeSqlQuery(); 
    }
    
    protected function executeSiblingQuery($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
        ->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position} AND employer_user_id='{employer_user_id}';")
          ->makeSqlQuery();     
    }
    
    protected function executeLoadById($db)
    {
        $db->setParameter('employer_user_id',$this->get('employer_user_id'))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%d' AND employer_user_id='{employer_user_id}';")
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
    
    
    function hasLevel()
    {
        return (boolean)$this->get('level_id');
    }
    
                      
     function getLevel()
    {
       return $this->_level_id=$this->_level_id===null?new EmployerLanguageLevel($this->get('level_id')):$this->_level_id;                 
    }  
    
     function getEmployerUser()
    {
       return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;                 
    }  
    
    
    function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }
}
