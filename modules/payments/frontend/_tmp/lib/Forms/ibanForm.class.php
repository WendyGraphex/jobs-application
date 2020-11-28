<?php

class ibanForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
                'iban' => new mfValidatorIBAN()
            ));
    }
}