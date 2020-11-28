<?php


class EmployeeAdvertI18nAbuseBase extends mfObject3 {
     
    protected static $fields=array('firstname','lastname','email','type_id','advert_i18n_id','employer_user_id','employee_user_id','message','created_at');    
   const table="t_employee_advert_i18n_abuse"; 
    protected static $fieldsNull=array('employer_user_id','employee_user_id','type_id');  
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',
                                        'advert_i18n_id'=>'EmployeeAdvertI18n',
                                        'type_id'=>'CustomerAbuseType'
                                       );  


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
        ));   
    }
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new  EmployeeAdvertI18nAbuseFormatter($this):$this->formatter;
    }
    
    function hasEmployerUser()
    {
        return $this->get('employer_user_id');
    }
    
    function getEmployerUser()
    {
        return $this->_employer_user_id= $this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')): $this->_employer_user_id;
    }
    
    function hasEmployeeUser()
    {
        return $this->get('employee_user_id');
    }
    
    function getEmployeeUser()
    {
        return $this->_employee_user_id= $this->_employee_user_id===null?new Employee($this->get('employee_user_id')): $this->_employee_user_id;
    }
    
    
    function getAdvertI18n()
    {
        return $this->_advert_i18n_id= $this->_advert_i18n_id===null?new EmployeeAdvertI18n($this->get('advert_i18n_id')): $this->_advert_i18n_id;
    }
    
     function hasType()
    {
        return $this->get('type_id');
    }
    
    function getType()
    {
        return $this->_type_id= $this->_type_id===null?new CustomerAbuseType($this->get('type_id')): $this->_type_id;
    }
    
    function create()
    {
        return $this->save();
    }
}
