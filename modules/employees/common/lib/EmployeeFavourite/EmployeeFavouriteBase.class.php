<?php

class EmployeeFavouriteBase extends mfObject3 {
     
    protected static $fields=array('employee_id','employer_id','employee_advert_lang','employee_advert_id','employer_advert_lang','employer_advert_id','employee_user_id','employer_user_id','created_at','updated_at');    
    const table="t_employee_favourite"; 
    protected static $foreignKeys=array( 'employee_user_id'=>'Employee',
                                         'employee_id'=>'Employee',
                                         'employer_id'=>'EmployerUser',
                                         'employer_user_id'=>'EmployerUser',
                                        );                                       
    protected static $fieldsNull=array('updated_at','employee_id','employer_id','employee_user_id','employer_user_id','employee_advert_id','employer_advert_id'); // By default


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
          
        function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeFavouriteFormatter($this):$this->formatter;
   }
   
   function hasEmployeeUser()
   {
       return (boolean)$this->get('employee_id');
   }
   
     function getEmployeeUser()
    {
        return $this->_employee_id=$this->_employee_id===null?new Employee($this->get('employee_id')):$this->_employee_id;
    }
    
    function hasEmployerUser()
   {
       return (boolean)$this->get('employer_id');
   }
    
      function getEmployerUser()
    {
        return $this->_employer_id=$this->_employer_id===null?new EmployerUser($this->get('employer_id')):$this->_employer_id;
    }
        
     function hasEmployeeAdvert()
   {
       return (boolean)$this->get('employee_advert_id');
   }
   
     function getEmployeeAdvert()
    {
        return $this->_employee_advert_id=$this->_employee_advert_id===null?new EmployeeAdvert($this->get('employee_advert_id')):$this->_employee_advert_id;
    }
    
     function getEmployeeAdvertI18n()
    {
        return $this->employee_advert_i18n=$this->employee_advert_i18n===null?new EmployeeAdvertI18n(array('advert_id'=>$this->get('employee_advert_id'),'lang'=>$this->get('employee_advert_lang'))):$this->employee_advert_i18n;
    }
    
    function hasEmployerAdvert()
   {
       return (boolean)$this->get('employer_advert_id');
   }
    
      function getEmployerAdvert()
    {
        return $this->_employer_advert_id=$this->_employer_advert_id===null?new EmployerAdvert($this->get('employer_advert_id')):$this->_employer_advert_id;
    }
    
     function getEmployerAdvertI18n()
    {
        return $this->employer_advert_i18n=$this->employer_advert_i18n===null?new EmployerAdvertI18n(array('advert_id'=>$this->get('employer_advert_id'),'lang'=>$this->get('employer_advert_lang'))):$this->employer_advert_i18n;
    }
 
}
