<?php

class EmployerUploadAdvertDocumentForm extends mfForm {
    
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
            'id'=>new ObjectExistsValidator('EmployerAdvert',array('key'=>false,'required'=>false,'empty_value'=>new EmployerAdvert(null,$this->getUser()))),               
            'file'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getFile()
    {
        return $this['file']->getValue();
    }
    
    
    function getAdvert()
    {
        return $this['id']->getValue();
    }
  
}

