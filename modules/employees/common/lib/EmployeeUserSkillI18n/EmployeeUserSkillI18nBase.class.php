<?php

class EmployeeUserSkillI18nBase extends mfObject3 {
     
    protected static $fields=array('lang','skill_id','value','created_at','updated_at');
    const table="t_employee_user_skill_i18n"; 
    protected static $foreignKeys=array( 'skill_id'=>'EmployeeUserSkill'); 
    
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
    
                      
     function getSkill()
    {
       return $this->_skill_id=$this->_skill_id===null?new EmployeeUserSkill($this->get('skill_id')):$this->_skill_id;                 
    }  
    
    function __toString() {
        return (string)$this->get('value');
    }
     
     function getValue()
    {
        return  new mfString($this->get('value'));
    }
}
