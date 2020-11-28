<?php

class EmployerWorkCategoryPopularBase extends mfObject3 {
     
    protected static $fields=array('employee_user_id','category_id','employer_user_id','lang','country','ip','created_at','updated_at');    
    const table="t_employer_category_popular"; 
    protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id');  
     protected static $foreignKeys=array('employee_user_id'=>'Employee',
                                         'category_id'=>'EmployeeWorkCategory',
                                         'employer_user_id'=>'EmployerUser');  

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);      
            if (isset($parameters['user']) && isset($parameters['category']) && $parameters['category'] instanceof EmployerWorkCategory)
             return $this->loadbyCategoryAndUser($parameters['category'],$parameters['user']);    
          return $this->add($parameters); 
      }
      else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
         
        } 
    }   
     
      function loadbyCategoryAndUser(EmployerWorkCategory $category,$user)
    {
        $this->set('category_id',$category);
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
    
      function getCategory()
    {
        return $this->_category_id=$this->_category_id===null?new EmployerWorkCategory($this->get('category_id')):$this->_category_id;
    }
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerWorkCategoryPopularFormatter($this):$this->formatter;
   }
   
    function create()
    {      
        $this->set('ip',mfContext::getInstance()->getRequest()->getIP());      
        return  $this->save();      
    }
}
