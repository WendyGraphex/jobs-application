<?php

require_once __DIR__."/CustomerEmployeeMessageNewForm.class.php";

class CustomerEmployeeMessageUploadFileForm extends CustomerEmployeeMessageNewForm {
       
    function configure()
    {
        parent::configure();
        $this->setValidator('file',new mfValidatorFile(array('max_size'=>16 * 1024 * 1024)));   
        $this->message->setOption('required',false);
        $this->subject->setOption('required',false);
    }
        
    
    function getFile()
    {
        return $this['file']->getValue();
    }
    
     
}

