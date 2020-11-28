<?php


class SmsBoxReturnForm extends mfForm {
    
    
    function configure()
    {
        $this->setOption('disabledCSRF',true);
        $this->setValidators(array(
           'numero'=>new mfValidatorString(),
           'reference'=>new mfValidatorString(),
           'accuse'=>new mfValidatorInteger(array('min'=>-3,'max'=>11)),
           'ts' =>new mfValidatorInteger(array('min'=>0,'max'=>time()+3600)),              
        ));
         
    }
    
}