<?php

class CustomerAcademyCourseDocumentUploadForm extends mfForm {
    
    protected $user=null;
    
    function __construct(CustomerAcademyTeacherUser $user,$defaults = array(), $options = array()) {
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
            'id'=>new ObjectExistsValidator('CustomerAcademyCourseI18n',array('key'=>false,'required'=>false,'empty_value'=>new CustomerAcademyCourseI18n(null,$this->getUser()))),               
            'file'=>new mfValidatorFile(array('max_size'=>32 * 1024 * 1024))
        ));      
    }
    
   
    function getFile()
    {
        return $this['file']->getValue();
    }
    
    
    function getCourseI18n()
    {
        return $this['id']->getValue();
    }
  
}

