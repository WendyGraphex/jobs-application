<?php

class EmployeeUserGraduateDiplomaI18nBase extends mfObject3 {
     
    protected static $fields=array('lang','user_graduate_id','diploma','location','city','created_at','updated_at');
    const table="t_employee_user_graduate_diploma_i18n";
     protected static $foreignKeys=array( 'user_graduate_id'=>'EmployeeUserGraduateDiploma'); 
        protected static $fieldsNull=array('updated_at'); 
    
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
         
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));      
    }        
       
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }   */     
           
   
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeUserGraduateDiplomaI18nFormatter($this):$this->formatter;
   }
}
