<?php


class SmsBoxCallbackReturnForm extends mfForm {
    
    
    function configure()
    {
        $this->setOption('disabledCSRF',true);
        $this->setValidators(array(
           'numero'=>new mfValidatorNumber(),
           'reference'=>new mfValidatorNumber(),
           'accuse'=>new mfValidatorNumber(array('min'=>-3,'max'=>11)),
           'ts' =>new mfValidatorInteger(),              
        ));  
    }
    
}