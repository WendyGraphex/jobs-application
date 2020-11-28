<?php


class EmployerUserViewForm extends EmployerUserCoreForm {
    
    protected $user=null;
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);        
    }
    
    function getUser()
    {
        return $this->user;
    }
     
    function configure()
    {             
        parent::configure();       
        $this->addValidators(array(                          
              'function_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerFunction::getAllI18nForSelect()->unshift(array(''=>__('Select a function')))))
        ));                        
    } 
        
     function getAvatar()
    {
        return $this['avatar']->getValue();
    }
}


