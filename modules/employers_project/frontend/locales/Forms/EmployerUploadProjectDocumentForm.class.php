<?php

class EmployerUploadProjectDocumentForm extends mfForm {
    
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
        $this->setValidators(array(       
            'id'=>new ObjectExistsValidator('EmployerProject',array('key'=>false,'required'=>false,'empty_value'=>new EmployerProject(null,$this->getUser()))),               
            'file'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getFile()
    {
        return $this['file']->getValue();
    }
    
    
    function getProject()
    {
        return $this['id']->getValue();
    }
  
}

