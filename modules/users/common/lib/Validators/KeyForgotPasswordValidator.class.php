<?php

class KeyForgotPasswordValidator extends mfValidatorString {
    
    function __construct() {
        parent::__construct(array("max_length"=>40,"min_length"=>40),
                            array("max_length"=>__('Key is invalid'),"min_length"=>__('Key is invalid'))
                );
    }
    
}

