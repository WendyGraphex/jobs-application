<?php

class UploadIconActivityForm extends mfForm {
           
    function configure()
    {
        $this->setValidators(array(                                  
            'file'=>new mfValidatorFile(array('max_size'=>4 * 1024 * 1024))
        ));      
    }
       
    function getFile()
    {
        return $this['file']->getValue();
    }
      
}

