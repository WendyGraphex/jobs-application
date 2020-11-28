<?php


class SendSmsForm extends mfForm {
    
   
     function configure() {
        $this->setValidators(array(
            'mobile'=>new mfValidatorString(array('min_length'=>10,'max_length'=>14)),
            'message'=>new mfValidatorString()
        ));   
     }
    
}


