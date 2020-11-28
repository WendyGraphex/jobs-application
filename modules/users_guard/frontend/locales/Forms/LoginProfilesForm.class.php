<?php


class LoginProfilesForm extends mfForm {
   
   
   function configure() {   
       $this->setValidators(array(           
           'email'=>new mfValidatorEmail(),
           'password'=>new mfValidatorString(),
           'remember' => new mfValidatorBoolean(array('empty_value'=>false)),
       ));
       $this->validatorSchema->setPostValidator(new UserGuardCustomerProfilesValidator());
   }
    
    function getUser()
    {
        return $this->values['profiles']->getFirst();
    }
    
    function getProfiles()
    {
        return $this->values['profiles'];
    }
    
    function isProfilUnique()
    {        
        return  $this->getProfiles()->isUnique();
    }
}
    


