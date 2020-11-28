<?php

class EmployeeUploadAdvertDocumentForm extends mfForm {
    
   
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
            'id'=>new ObjectExistsValidator('EmployeeAdvert',array('key'=>false,'required'=>false,'empty_value'=>new EmployeeAdvert(null,$this->getUser()))),               
            'file'=>new mfValidatorFile(array('max_size'=>EmployeeAdvertDocument::EMPLOYEE_USER_ADVERT_DOCUMENT_MAX_SIZE))
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

