<?php


class EmployeeAdvertCommentBase extends CustomerAdvertComment {
        
    protected static $fields=array('employee_user_id','employer_user_id','employee_advert_id','published_at','project_id','sender', 'quotation_id','employee_advert_lang','is_active','created_at','updated_at');    
  //  const table="t_employee_advert_comment"; 
  //  protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id','published_at',);  
     protected static $foreignKeys=array('employee_user_id'=>'Employee', 
                                         'employee_advert_id'=>'EmployeeAdvert',
                                         'project_id'=>'Project',
                                         'quotation_id'=>'SaleEmployeeQuotation',
                                         'employer_user_id'=>'EmployerUser');  


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
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployeeAdvertCommentFormatter($this):$this->formatter;
    }
        
    function getI18ns()
    {
        return $this->i18ns=$this->i18ns===null?new EmployeeAdvertCommentI18nCollection($this):$this->i18ns;
    } 
    
    function setI18n($i18n)
    {
        $this->i18n=$i18n;
        return $this;
    }
    
    function getI18n()
    {
        if ($this->i18n===null)
        {
            
        }   
        return $this->i18n;
    }            
    
      function getAdvert()
    {
        return $this->_advert_id=$this->_advert_id===null?new EmployeeAdvert($this->get('employee_advert_id')):$this->_advert_id;
    }
    
      function getAdvertI18n()
    {
        return $this->advert_i18n=$this->advert_i18n===null?new EmployeeAdvertI18n(array('lang'=>$this->get('advert_lang'),'advert_id'=>$this->get('employee_advert_id'))):$this->advert_i18n;
    }
   
}
