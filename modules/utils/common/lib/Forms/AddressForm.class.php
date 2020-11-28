<?php

class AddressForm extends mfForm {
    
     function configure()
    {       
        $this->setValidators(array(           
            'address1'=>new mfValidatorString(),
            'address2'=>new mfValidatorString(array("required"=>false)),
            'postcode'=>new mfValidatorString(),
            'city'=>new mfValidatorString(),
           // 'country'=>new mfValidatorI18nChoiceCountry(), 
           // 'state'=>new mfValidatorI18nState($this->getDefault('country')),
        ));       
    }
}