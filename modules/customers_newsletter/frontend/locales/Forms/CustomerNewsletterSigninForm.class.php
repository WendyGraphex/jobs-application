<?php


class CustomerNewsletterSigninForm extends mfForm {

    function configure() { 
       $this->setValidators(array(
            'email' => new mfValidatorEmail(), 
        ));
    }
    
    function getEmail()
    {
        return $this['email']->getValue();
    }
}
