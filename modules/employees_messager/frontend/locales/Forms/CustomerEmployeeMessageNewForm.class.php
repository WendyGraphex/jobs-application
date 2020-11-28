<?php


class CustomerEmployeeMessageNewForm extends mfForm {
    
     protected $user=null,$_message=null;
    
    function __construct(Employee $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function configure() {
        $this->setValidators(array(
             'parent_id'=>new CustomerEmployeeMessageValidator($this->getUser()),   
             'id'=>new CustomerEmployeeMessageValidator($this->getUser(),array('required'=>false,'empty_value'=>new CustomerEmployeeMessage(null,$this->getUser()))),                    
             'subject'=>new mfValidatorString(),
             'message'=>new mfValidatorString(),
        ));
    }
    
    function getParent()
    {       
       return $this['parent_id']->getValue();      
    }
    
    function getValues()
    {
        return array('parent_id'=>$this->getParent(),'sender'=>'EMPLOYEE','message'=>$this->getValue('message'),'subject'=>$this->getValue('subject'));
    }
    
    function getMessage()
    {       
       if ($this->_message===null)
       {    
        $this->_message=$this['id']->getValue()->add($this->getValues());
        if ($this['id']->getValue()->isLoaded())        
           return $this->_message;        
        if ($this->getParent()->hasEmployerUser())
            $this->_message->set('employer_user_id',$this->getParent()->getEmployerUser());
        else
            $this->_message->set('user_id',$this->getParent()->getUser());        
       }
       return $this->_message;
    }
}