<?php

class EmployerAdvertCommentI18nForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                                   
            'message'=>new mfValidatorString(array('max_length'=>500)),
            'lang'=>new mfValidatorString(array('min_length'=>2,'max_length'=>2))
        ));
    }
    
 
}

