<?php


class ProjectTaskValidator extends mfValidatorString {
 
    protected $user=null;
    
    function  __construct($user,$options=array(),$messages=array()) {
        $this->user=$user;
        parent::__construct($options, $messages);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    protected function doIsValid($value) 
    {      
         $item=new ProjectTask($value,$this->getUser());      
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
