<?php


class CustomerNewsletterForm extends mfForm {

    function configure() { 
       $this->setValidators(array(
            'email' => new mfValidatorEmail(), 
        ));
    }
}