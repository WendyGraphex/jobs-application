<?php

/*
 *  Employee => Employer
 * 
 */

class EmployerAdvertCommentBase extends CustomerAdvertComment {
        
      protected static $fields=array('employee_user_id','employer_user_id','project_id','published_at','employer_advert_id','sender','employer_advert_lang','quotation_id','is_active','created_at','updated_at');    
  //  const table="t_employer_advert_comment"; 
   // protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id','published_at');  
     protected static $foreignKeys=array('employee_user_id'=>'Employee', 
                                         'employer_advert_id'=>'EmployerAdvert',
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
        return $this->formatter=$this->formatter===null?new EmployerAdvertCommentFormatter($this):$this->formatter;
    }
    
    
    function getI18ns()
    {
        return $this->i18ns=$this->i18ns===null?new EmployerAdvertCommentI18nCollection($this):$this->i18ns;
    }
    
    
    
      function getAdvert()
    {
        return $this->_advert_id=$this->_advert_id===null?new EmployerAdvert($this->get('employer_advert_id')):$this->_advert_id;
    }
    
      function getAdvertI18n()
    {
        return $this->advert_i18n=$this->advert_i18n===null?new EmployerAdvertI18n(array('lang'=>$this->get('employer_advert_lang'),'advert_id'=>$this->get('employer_advert_id'))):$this->advert_i18n;
    }
    
}
