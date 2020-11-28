<?php

 
class CustomerRegistrationBase extends mfObject3 {
     
      protected static $fields=array('gender','phone','race','has_experience','other_attending','attending','level','profession',
                                      'other_level','firstname','lastname','email','city','state','postcode','country', 'created_at','updated_at');    
   const table="t_customer_registration"; 

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
            'has_experience'=>'NO',
        ));       
    }
              
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
                
    function toArrayForEmail()
    {
        $values=$this->toArray();         
        return $values;
    }
    
    function getEmailWithName()
    {
        return array($this->get('email')=>$this->getName());
    }    
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerRegistrationFormatter($this):$this->formatter;
    }
      
    function getGender()
    {
        return $this->get('gender');
    }    
}
