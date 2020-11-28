<?php


class SendQuoteNegociatedEmployerForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'description'=>new mfValidatorString(array('max_length'=>500,'min_length'=>0)),          
        ));
    }
      
}
   
