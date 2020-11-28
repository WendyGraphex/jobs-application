<?php


class CustomerEmployerMessageValidator extends mfValidatorString {

    protected $user=null;
    
    function __construct(Employer $user,$options=array())
    {       
        $this->user=$user;
        parent::__construct($options);       
    }      
    
    function getUser()
    {
        return $this->user;
    }
    
    protected function doIsValid($value) 
    {
         $item=new CustomerEmployerMessage($value,$this->getUser());
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
