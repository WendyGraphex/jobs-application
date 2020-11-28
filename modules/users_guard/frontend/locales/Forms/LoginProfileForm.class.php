<?php


class LoginProfileForm extends mfForm {
    
    protected $profiles=null;
    
    function __construct($user,$default=array(),$messages=array())
    {
        $this->profiles=$user->getProfiles();
        parent::__construct($default,$messages);
    }
    
    function configure()
    {         
        $this->setValidators(array(           
            'profile'=>new mfValidatorChoice(array('choices'=>array('professional','private'))),                      
        ));             
    }
    
    function getUser()
    {      
        if ($this['profile']->getValue()=='professional')      
            return $this->profiles->getProfile('CompanyUser');
         return $this->profiles->getProfile('User');                  
    }
    
   
    
   
}


