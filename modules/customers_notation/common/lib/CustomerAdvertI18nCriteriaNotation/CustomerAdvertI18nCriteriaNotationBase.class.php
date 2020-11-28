<?php


class CustomerAdvertI18nCriteriaNotationBase extends mfObject3 {
     
    protected static $fields=array( 'employee_user_id','employer_user_id',
                                   'employee_advert_id','employee_advert_lang',
                                   'employer_advert_id','employer_advert_lang','work_id','project_id','quotation_id',
                                   'employee_criteria_id','employer_criteria_id','notation','created_at','updated_at');
    const table="t_customer_user_advert_i18n_notation";
    protected static $fieldsNull=array('updated_at','employee_id','employer_id','employee_user_id','employer_user_id','employee_advert_id','work_id',
                                   'employer_advert_id','employee_criteria_id','employer_criteria_id'); 
    protected static $foreignKeys=array('employee_user_id'=>'Employee',
                                        'employer_user_id'=>'EmployerUser',
                                       
                                        'employer_advert_id'=>'EmployerAdvert',
                                        'employee_advert_id'=>'EmployeeAdvert',
                                        'work_id'=>'EmployeeWork',
                                        'employee_criteria_id'=>'EmployeeNotationCriteria',
                                        'employer_criteria_id'=>'EmployerNotationCriteria',
                                        'project_id'=>'Project',
                                          'quotation_id'=>'SaleEmployeeQuotation',
                                        ); // By default
    
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
    
  /*   function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeNotationFormatter($this):$this->formatter;
   }
   */
    
     function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    } 
    
     function getEmployerUser()
    {
       return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;                 
    } 
    
    function getEmployerCriteria()
    {
       return $this->_employer_criteria_id=$this->_employer_criteria_id===null?new EmployerNotationCriteria($this->get('employer_criteria_id')):$this->_employer_criteria_id;                 
    }  
    
    function getEmployeeCriteria()
    {
       return $this->_employee_criteria_id=$this->_employee_criteria_id===null?new EmployeeNotationCriteria($this->get('employee_criteria_id')):$this->_employee_criteria_id;                 
    }      
    
    
     function getProject()
    {
        return $this->_project_id=$this->_project_id===null?new Project($this->get('project_id')):$this->_project_id;
    }
    
     public function getQuotation()
    {      
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    }
    
     public function getWork()
    {      
        return $this->_work_id=$this->_work_id===null?new EmployeeWork($this->get('work_id')):$this->_work_id;
    } 
    
     function isEmployerSender()
    {
        return $this->get('sender')=='EMPLOYER';
    }
    
     function isEmployeeSender()
    {
        return $this->get('sender')=='EMPLOYEE';
    }
    
    function hasEmployeeAdvertI18n()
    {
       return (boolean)$this->get('employee_advert_id'); 
    }
    
    
     function getEmployeeAdvertI18n()
    {
       return $this->employee_advert_i18n_id=$this->employee_advert_i18n_id===null?new EmployeeAdvertI18n(array('advert_id'=>$this->get('employee_advert_id'),'lang'=>$this->get('employee_lang'))):$this->employee_advert_i18n_id;                 
    } 
    
    function hasEmployerAdvertI18n()
    {
       return (boolean)$this->get('employer_advert_id'); 
    }
    
     function getEmployerAdvertI18n()
    {
       return $this->employer_advert_i18n_id=$this->employer_advert_i18n_id===null?new EmployerAdvertI18n(array('advert_id'=>$this->get('employer_advert_id'),'lang'=>$this->get('employer_lang'))):$this->employer_advert_i18n_id;                 
    } 
    
    function getAdvertI18n()
    {
        if ($this->advert_i18n===null)
        {    
            if ($this->hasEmployerAdvertI18n())
                return $this->getEmployerAdvertI18n();
            return $this->getEmployeeAdvertI18n();
        }
        return $this->advert_i18n;
    }
}
