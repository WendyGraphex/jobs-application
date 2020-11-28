<?php


class EmployeePortfolioDocumentValidator extends mfValidatorString {

    protected $user=null;
    
    function __construct(Employee $user,$options=array())
    {
        $this->user=$user;        
        parent::__construct($options);       
    }
    
    function getEmployeeUser()
    {
        return $this->user;
    }
     
    protected function doIsValid($value) 
    {             
         $item=new EmployeePortfolioDocument($value,$this->getEmployeeUser());      
         if ($item->isNotLoaded())
        {
           if ($value=="" || $value=="0")
           {
               if ($this->getOption('required')==true)
                   throw new mfValidatorError($this, 'required');                    
               return $item;
           }   
           throw new mfValidatorError($this, 'invalid', array('value' => $value));
        }        
        return $item;
    }

}