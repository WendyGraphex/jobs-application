<?php

class PaymentEmployeeSettingsBase extends mfObject3 {
                
    protected static $fields=array('employee_user_id',                               
                                   'method_id',                                                                 
                                   'parameters', 
                                   'options', 
                                   'is_default',
                                   'is_validated',
                                   'created_at','updated_at');
    const table="t_payment_employee_user_settings"; 
    protected static $fieldsNull=array('method_id','employee_user_id'); // By default
    protected static $foreignKeys=array('employee_user_id'=>'EmployeeUser',                                       
                                        'method_id'=>'PaymentMethod',   
                                       // 'status_id'=>'CustomerContractBillingStatus'
                                        ); 

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);     
          if (isset($parameters['payment_employee_id']))
             return $this->loadByPaymentEmployee($parameters['payment_employee_id']);
          return $this->add($parameters); 
      }
      else
        {                    
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
            
    function loadByPaymentEmployee($payment_employee_id)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('payment_user_id'=>$payment_employee_id))         
           ->setQuery("SELECT ".self::getFieldsWithTable()." FROM ".self::getTable().  
                      " INNER JOIN ".PaymentEmployee::getTable()." ON ".PaymentEmployee::getTableField('method_id')."=".self::getTableField('method_id').
                            " AND ".PaymentEmployee::getTableField('employee_user_id')."=".self::getTableField('employee_user_id').
                      " WHERE  ".PaymentEmployee::getTableField('id')."='{payment_user_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),     
            'is_default'=>'NO',
            'is_validated'=>'NO',
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
          
  
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
       function getMethod()
   {
       return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id;
   }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new PaymentEmployeeSettingsFormatter($this):$this->formatter;
   }
   
   
/*     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }*/
    
   function isDefault()
   {
       return $this->get('is_default')=='YES';
   }
   
     function setMethod(PaymentMethod $method)
    {        
        $this->set('method_id',$method);       
        return $this;
    }
    
    function getOptions()
    {
        return $this->_options=$this->_options===null?new PaymentEmployeeSettingsOptions($this->get('options')):$this->_options;
    } 
    
    function setOptions($options)
    {
        $this->set('options',json_encode($options));
        $this->_options=null;
        return $this;
    }
    
    static function getAllForEmployee(Employee $employee)
    {
        $list=new PaymentEmployeeSettingsCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('employee_user_id'=>$employee->get('id')))                               
                    ->setQuery("SELECT ".PaymentEmployeeSettings::getFieldsAndKeyWithTable().",name FROM ".PaymentEmployeeSettings::getTable().    
                               " INNER JOIN ".PaymentEmployeeSettings::getOuterForJoin('method_id').
                               " WHERE employee_user_id='{employee_user_id}'".
                               ";")
                    ->makeSqlQuery();   
      // echo $db->getQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($item=$db->fetchObject('PaymentEmployeeSettings'))
        {                                   
           $list[$item->get('name')]=$item->loaded();
        }  
       $list->loaded();
       return $list; 
    }
   
    static function updateEmployee(PaymentEmployeeSettingsCollection $settings,$selected,Employee $employee)
    {
         // echo "<pre>"; var_dump($values,$selected);
       // var_dump($values->getMethods());   
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('employee_user_id'=>$employee->get('id')))                               
                  ->setQuery("DELETE ".PaymentEmployeeSettings::getTable()." FROM ".PaymentEmployeeSettings::getTable().    
                             " INNER JOIN ".PaymentEmployeeSettings::getOuterForJoin('method_id').
                             " WHERE employee_user_id='{employee_user_id}' AND name NOT IN('".$settings->getMethods()->implode("','")."')".
                             ";")
                  ->makeSqlQuery();                          
      // $settings->getItemByKey($selected->get('name'))->set('is_default','YES');
       $settings->save();     
       
       
    }
    
    function isValidated()
    {
        return $this->get('is_validated')=="YES";
    }
    
    
   static function getSettings()
   {   
       static $list=null;
       if ($list) return $list;
       return $list=new PaymentEmployeeSettingsCollection();             
   }
}