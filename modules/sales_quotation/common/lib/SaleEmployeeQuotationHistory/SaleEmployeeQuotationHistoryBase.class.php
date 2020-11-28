<?php

class SaleEmployeeQuotationHistoryBase extends mfObject3 {
     
    protected static $fields=array( 
                                  'employer_user_id','employee_user_id','description','version','price',
                                  'employee_state','employer_state','employee_stated_at','employer_stated_at','state',
                                  'in_at','out_at','number_of_hours','schedule_needed','quotation_id','sender',
                                    'created_at','updated_at');    
    const table="t_sale_employee_quotation_history"; 
    protected static $fieldsNull=array('updated_at','state',
                                       'employee_state','employer_state','employee_stated_at','employer_stated_at',
                                       'in_at','out_at',
                                      ); // By default
    protected static $foreignKeys=array(   
                                        'employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',                                   
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
          if ($parameters instanceof SaleEmployeeQuotation)
              return $this->loadByQuotation($parameters);
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);        
        } 
    }   
      
      
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
          //  'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),            
        ));      
    }
            
    /*  function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }    */
            
   /*   protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
    protected function loadByQuotation(SaleEmployeeQuotation $quotation)
    {
       $this->set('quotation_id',$quotation);    
    }
    
        function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SaleEmployeeQuotationHistoryFormatter($this):$this->formatter;
   }
       
    
    function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
         
      function getQuotation()
   {
       return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
   }
     
       function isRefused()
    {
         return $this->get('employee_state')=='REFUSED'  || $this->get('employer_state')=='REFUSED';
    }
    
    function isAccepted()
    {
         return $this->get('employee_state')=='ACCEPTED' && $this->get('employer_state')=='ACCEPTED';
    }
    
    function isEmployeeProposed()
    {
        return $this->get('employee_state')=='PROPOSED';
    }
    
    function isEmployeeAccepted()
    {
        return $this->get('employee_state')=='ACCEPTED';
    }
    
      function isEmployeeNegociated()
    {
        return $this->get('employee_state')=='NEGOCIATED';
    }
    
    function isEmployerAccepted()
    {
        return $this->get('employer_state')=='ACCEPTED';
    }
    
     function isEmployerRefused()
    {
        return $this->get('employer_state')=='REFUSED';
    }
    
     function isEmployerNegociated()
    {
        return $this->get('employer_state')=='NEGOCIATED';
    }
    
     function isEmployeeRefused()
    {
        return $this->get('employee_state')=='REFUSED';
    }
    
     function hasInAt()
    {
        return (boolean)$this->get('in_at'); 
    }
    
    function hasOutAt()
    {
        return (boolean)$this->get('out_at'); 
    }
    
       function isScheduleNeeded()
    {
        return $this->get('schedule_needed')=='Y';
    }
    
    function isSenderEmployer()
    {
        return $this->get('sender')== 'EMPLOYER';
    }
    
    function isSenderEmployee()
    {
        return $this->get('sender') =='EMPLOYEE';
    }
    
    
   function copy()
   {
       if ($this->getQuotation()->isNotLoaded())
          return $this;
       foreach (array( 'employer_user_id','employee_user_id','description','version','price','sender',
                       'employee_state','employer_state','employee_stated_at','employer_stated_at','state',
                       'in_at','out_at','sender','number_of_hours','schedule_needed') as $field)
       {
           $this->set($field,$this->getQuotation()->get($field));           
       }        
       $this->set('created_at',$this->getQuotation()->get('updated_at'));
       $this->save();
       return $this;
   }
}