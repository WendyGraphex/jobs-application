<?php

class SmsboxCallbackImportFileForm extends mfForm {

  

    function configure() { 
        $this->setValidators(array(    
            'accuse'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=> SmsBoxCallback::getCallbackErrorForSelect()->unshift(array(""=>"")))),
            'file'=>new mfValidatorFile(array('max_size'=>5 * 1024 *1024,'mime_types'=>array( 'text/plain','text/x-c++','text/x-c','text/csv', 'text/comma-separated-values'))),                       
        ));
        $this->getValidatorSchema()->setOption('allow_extra_fields');
    }
    
    function getFile()
    {
       return $this->getValue('file')->getTempName();                         
    }
    
    
    function getAccuse()
    {
        return $this['accuse']->getValue();
    }
   
}
