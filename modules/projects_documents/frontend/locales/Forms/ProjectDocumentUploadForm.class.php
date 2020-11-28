<?php

class ProjectDocumentUploadForm extends mfForm {
    
    protected $user=null;
    
    function __construct($user,$defaults = array(), $options = array()) {
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
            'id'=>new ProjectTaskValidator($this->getUser()),             
            'file'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
    
   
    function getFile()
    {
        return $this['file']->getValue();
    }
    
    
    function getTask()
    {
        return $this['id']->getValue();
    }
  
}

