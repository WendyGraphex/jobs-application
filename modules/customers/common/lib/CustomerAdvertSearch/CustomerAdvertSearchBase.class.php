<?php

class CustomerAdvertSearchBase extends mfObject3 {
     
       
    protected static $fields=array('employer_user_id','employee_user_id','category_id','number_of_results','ip','culture','lang','country',
                                     'city','query','location','type',
                                    'created_at','updated_at');
    const table="t_customer_advert_search";
    protected static $fieldsNull=array('updated_at','employer_user_id','employee_user_id','category_id',); 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',
                                        'category_id'=>'EmployeeWorkCategory',); 


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
     /* protected function loadByPhoneOrMobile($phone)
      {       
           $this->set('phone',$phone);
           $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR mobile='{phone}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }*/
      
     
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
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
   
   
   function hasCategory()
    {
       return (boolean)$this->get('category_id');              
    } 
    
        function hasEmployeeUser()
    {
        return (boolean)$this->get('employee_user_id');
    }
    
        function hasEmployerUser()
    {
        return (boolean)$this->get('employer_user_id');
    }
     
        function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
        function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
    function setUser($user)
    {
        if ($user===null)
            return $this;
        if ($user instanceof Employee)
            return $this->set('employee_user_id',$user);
         if ($user instanceof EmployerUser)
            return $this->set('employer_user_id',$user);
         return $this;
    }
    
    function getUrl()
    {
        if ($this->get('type')=='employee')
            return url_i18n_to("employees_search")."?".$this->getFormatter()->getParametersForUrl();
        return url_i18n_to("employers_search")."?".$this->getFormatter()->getParametersForUrl();
    }
}