<?php

class EmployeePortfolioDocumentUploadForm extends mfForm {
           
    function configure()
    {
        $this->setValidators(array(                                  
            'file'=>new mfValidatorFile(array('max_size'=>8 * 1024 * 1024))
        ));      
    }
       
    function getFile()
    {
        return $this['file']->getValue();
    }
      
}

