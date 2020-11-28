<?php

class EmployerProjectAddForQuoteForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->employer_user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    
    function configure()
    {
        $this->setValidators(array(            
             'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),
        ));        
    }
    
    function getSelection()
    {
        return EmployerProjectUtils::getActiveProjectForEmployerAndSelection($this->getEmployerUser(),$this['selection']->getArray());
    }
       
}

