<?php

class CityForm extends mfForm {

    function configure() {       
        $this->setOption('disabledCSRF',true);
        $this->setValidators(array(
             'postcode' => new mfValidatorInteger(),  
             'country' => new mfValidatorI18nChoiceCountry(),
        ));        
    }
}

