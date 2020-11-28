<?php

class EmployerAdvertFavouriteBase extends mfObject3 {
     
    protected static $fields=array('advert_id','lang','employee_user_id','employer_user_id','created_at','updated_at');    
    const table="t_employer_advert_favourite"; 
    protected static $foreignKeys=array( 'employee_user_id'=>'Employee',
                                        'employer_user_id'=>'EmployerUser',
                                        'advert_id'=>'EmployerAdvert');                                       
    protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id'); // By default


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
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
      
    
}
