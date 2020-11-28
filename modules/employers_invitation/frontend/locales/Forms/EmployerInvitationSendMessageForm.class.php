<?php

class EmployerInvitationSendMessageForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
           // 'subject'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),         
             'message'=>new mfValidatorString(array('min_length'=>20,'max_length'=>500)),
             'friend_firstname' =>new mfValidatorString(),
            'friend_lastname' =>new mfValidatorString(),
            'friend_email' => new mfValidatorEmail(),         
        ));  
        
    }
    
}
