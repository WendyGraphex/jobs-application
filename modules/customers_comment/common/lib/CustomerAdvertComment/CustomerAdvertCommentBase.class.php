<?php


class CustomerAdvertCommentBase extends mfObject3 {
        
   protected static $fields=array('employee_user_id','employer_user_id','employee_advert_id','employer_advert_id','published_at','project_id','sender', 
                                  'quotation_id','employee_advert_lang','employer_advert_lang','is_active','created_at','updated_at');    
    const table="t_customer_advert_comment"; 
    protected static $fieldsNull=array('updated_at','employer_advert_id','employee_advert_id','employee_user_id','employer_user_id','published_at',);  
     protected static $foreignKeys=array('employee_user_id'=>'Employee', 
                                         'employee_advert_id'=>'EmployeeAdvert',
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
    
     protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),    
            'is_active'=>'NO',
        ));      
    }
              
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
     
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
      function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     
       function getProject()
    {
        return $this->_project_id=$this->_project_id===null?new Project($this->get('project_id')):$this->_project_id;
    }
    
      public function getQuotation()
    {      
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    }
     
    function isEmployerSender()
    {
        return $this->get('sender')=='EMPLOYER';
    }
    
     function isEmployeeSender()
    {
        return $this->get('sender')=='EMPLOYEE';
    }
    
    function hasPublishedAt()
    {
        return (boolean)$this->get('published_at');
    }
    
    
    function publish()
    {
        $this->set('published_at',date("Y-m-d H:i:s"));   
        $this->set('is_active','YES');
        $this->save();
        return $this;
    }
    
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}
