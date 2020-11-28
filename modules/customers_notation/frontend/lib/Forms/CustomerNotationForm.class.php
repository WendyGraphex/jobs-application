<?php

class CustomerNotationForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'notation'=>new mfValidatorInteger(),
            'criteria_id'=>new  mfValidatorInteger(),
        ));
    }
}
