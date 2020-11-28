<?php

class EmployerPictureContentUploadForm extends mfForm {
    
   
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
            'file'=>new mfValidatorFile(array('max_size'=>EmployerContent::EMPLOYER_USER_CONTENT_MAX_SIZE))
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

