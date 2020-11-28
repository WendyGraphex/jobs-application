<?php

class ProjectBase extends mfObject3 {
         
    protected static $fields=array('name','abr','estimated_duration','duration','description',
                                    'start_at','end_at','color','logo','reference','quotation_id',
                                    'employee_user_id','employer_user_id','order_id','project_id','work_id',
                                    'has_employee_notation','has_employer_notation',
                                   'is_active','state_id','status','parameters','number_of_tasks','number_of_payments',
                                   'created_at','updated_at');
     protected static $fieldsNull=array('updated_at','state','start_at','end_at','state_id','project_id');        
    const table="t_project"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',    
                                        'quotation_id'=>'SaleEmployeeQuotation',
                                        'project_id'=>'EmployerProject',
                                        'order_id'=>'SaleOrder',
                                        'work_id'=>'EmployeeWork',
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
            'updated_at'=>date("Y-m-d H:i:s"),  
            'number_of_payments'=>0,
            'is_active'=>'YES',
            'status'=>'ACTIVE',
            'has_employee_notation'=>'NO',
            'has_employer_notation'=>'NO',
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
    /*  protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
    public function getQuotation()
    {      
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    }
    
    public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    } 
    
     public function getWork()
    {      
        return $this->_work_id=$this->_work_id===null?new EmployeeWork($this->get('work_id')):$this->_work_id;
    } 
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new ProjectFormatter($this):$this->formatter;
   }
  
   
     function getSettings()
    {
        return $this->settings=$this->settings===null?new ProjectSettings():$this->settings;
    }
    
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('project_reference_format','PR{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('project_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   
    function getStateI18n()
    {
       return __($this->get('state'));
    }
    
    function hasStartAt()
    {
        return (boolean)$this->get('start_at');
    }
    
     function hasEndAt()
    {
        return (boolean)$this->get('end_at');
    }
    
    function getNumberOfTasks()
    {
        return intval($this->get('number_of_tasks'));
    }
    
     function getNumberOfPayments()
    {
        return intval($this->get('number_of_payments'));
    }
    
    function hasPayments()
    {
        return (boolean)$this->get('number_of_payments');
    }
    
    
    function process()
    {
        if ($this->hasStartAt() && $this->hasEndAt())
        {    
            $this->set('duration',24 * $this->getFormatter()->getStartAt()->diffInDay($this->getFormatter()->getEndAt())); 
        }
        return $this;
    }
    
      function getStatus()
    {
        return $this->_status=$this->_status===null?new ProjectStatus($this,'status'):$this->_status;
    }
    
    function getEmployerReviews()
    {
        return $this->reviews=$this->reviews===null?new EmployerNotationCategoryCollection($this):$this->reviews;
    }
    
    function getEmployeeReviews()
    {
        return $this->reviews=$this->reviews===null?new EmployeeNotationCategoryCollection($this):$this->reviews;
    }
    
    
    function hasEmployeeNotation()
    {
        return $this->get('has_employee_notation')=='YES';
    }
    
     function hasEmployerNotation()
    {
        return $this->get('has_employer_notation')=='YES';
    }
    
    
    function close()
    {
        $this->set('status','CLOSE');
        $this->save();
        return $this;
    }
}