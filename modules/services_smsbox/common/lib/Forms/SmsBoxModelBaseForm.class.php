<?php

class SmsBoxModelBaseForm extends mfForm {

   
    
    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),           
            'name' => new mfValidatorName(),
            'color' => new mfValidatorColor(),
            'content'=>new mfValidatorString(),
        ));
    }
}