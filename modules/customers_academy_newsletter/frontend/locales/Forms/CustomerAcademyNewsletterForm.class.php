<?php


class CustomerAcademyNewsletterForm extends mfForm {

    function configure() { 
       $this->setValidators(array(
            'email' => new mfValidatorEmail(), 
        ));
    }
}