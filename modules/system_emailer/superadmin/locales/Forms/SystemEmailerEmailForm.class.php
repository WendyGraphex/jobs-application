<?php


class SystemEmailerEmailForm extends mfForm {
    
    
    function configure()
    {
        $this->setValidators(array(
            'email'=>new mfValidatorEmail(),
            'from'=>new mfValidatorEmail(array('required'=>false)),
            'body'=>new mfValidatorString()
        ));
    }
    
    
    
}


