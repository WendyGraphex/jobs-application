<?php


class SendQuoteNegociatedEmployeeForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'description'=>new mfValidatorString(array('max_length'=>500,'min_length'=>0)),      
            'price'=>new mfValidatorI18nNumber()
        ));
    }
          
}
   
