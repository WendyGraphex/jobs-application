<?php

class EmployerAdvertPopularBase extends mfObject3 {
     
     protected static $fields=array('employee_user_id','advert_id','employer_user_id','lang','country','ip','created_at','updated_at');    
    const table="t_employer_advert_popular"; 
    protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id');  
    protected static $foreignKeys=array('employee_user_id'=>'Employee',
                                         'advert_id'=>'EmployerAdvert',
                                         'employer_user_id'=>'EmployerUser');  

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
             if (isset($parameters['advert']) && isset($parameters['user']) && $parameters['advert'] instanceof EmployerAdvert)
             return $this->loadbyAdvertAndUser($parameters['advert'],$parameters['user']);    
          return $this->add($parameters); 
      }
      else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
         
        } 
    }   
       function loadbyAdvertAndUser(EmployerAdvert $advert,$user)
    {
        $this->set('advert_id',$advert);
        $this->set('lang',$user->getLanguage());
        $this->set('country',$user->getCountry());
        if ($user->isAuthenticated() && $user->isEmployee())
            $this->set('employee_user_id',$user->getGuardUser());
         if ($user->isAuthenticated() && $user->isEmployerUser())
            $this->set('employer_user_id',$user->getGuardUser());
    }
    
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
    
      function getAdvert()
    {
        return $this->_advert_id=$this->_advert_id===null?new EmployerAdvert($this->get('advert_id')):$this->_advert_id;
    }
    
    function getAdvertI18n()
    {
        return $this->advert_i18n=$this->advert_i18n===null?new EmployerAdvertI18n(array('advert_id'=>$this->get('advert_id'),'lang'=>$this->get('lang'))):$this->advert_i18n;
    }
    
    
       function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerAdvertPopularFormatter($this):$this->formatter;
   }
          
    function create()
    {     
    
        $this->set('ip',mfContext::getInstance()->getRequest()->getIP());      
        $this->getAdvertI18n()->set('number_of_views',$this->getAdvertI18n()->getNumberOfViews() + 1)->save();
        $this->getAdvert()->getEmployerUser()->addNumberOfViews();       
        return  $this->save();      
    }
}