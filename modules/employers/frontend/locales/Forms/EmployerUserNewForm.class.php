<?php


class EmployerUserNewForm extends EmployerUserCoreForm {
    
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
        unset($this['id']);           
    } 
    
     function getValues()
    {
        $values=parent::getValues();      
        $values['company_id']=$this->getUser()->get('company_id');
        $values['creator_id']=$this->getUser();
        $values['is_validated']='YES';        
        return $values;
    }
    
     function getAvatar()
    {
        return $this['avatar']->getValue();
    }
}


