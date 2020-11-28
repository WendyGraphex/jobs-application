<?php


class EmployeeUserNotationBase extends mfObject3 {
     
    protected static $fields=array('employee_user_id','employer_user_id','criteria_id','notation','created_at','updated_at');
    const table="t_employee_user_notation";
    protected static $fieldsNull=array('updated_at'); 
    protected static $foreignKeys=array('employee_user_id'=>'Employee',
                                        'employer_user_id'=>'EmployerUser',
                                        'criteria_id'=>'EmployeeNotationCriteria'); // By default
    
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
         parent::getDefaults();
    }        
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeNotationFormatter($this):$this->formatter;
   }
   
    
     function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    } 
    
     function getEmployerUser()
    {
       return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;                 
    } 
    
      function getCriteria()
    {
       return $this->_criteria_id=$this->_criteria_id===null?new EmployeeNotationCriteria($this->get('criteria_id')):$this->_criteria_id;                 
    }  
}
