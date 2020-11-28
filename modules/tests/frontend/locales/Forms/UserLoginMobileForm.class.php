<?php


class UserLoginMobileForm extends mfFormMobile {
    
    
    function configure()
    {         
        $this->setValidators(array(           
            'email'=>new mfValidatorEmail(),           
            'password'=>new mfValidatorString(),                      
        ));            
    }
        
}


