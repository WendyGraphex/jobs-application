<?php

class CustomerContactBase extends mfObject3 {
     
      protected static $fields=array('gender','phone','firstname','lastname','email','subject','message', 'created_at','updated_at');    
   const table="t_customer_contact"; 

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
            'updated_at'=>date("Y-m-d H:i:s")
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
        return $this->formatter=$this->formatter===null?new CustomerContactFormatter($this):$this->formatter;
    }
          
}