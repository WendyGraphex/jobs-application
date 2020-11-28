<?php

class SmsBoxBaseForm extends mfForm {

   
    
    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
           
        ));
    }
}