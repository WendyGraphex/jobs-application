<?php


class UserLoginMobileForm extends mfFormMobile {
    
    
    function configure()
    {         
        $this->setValidators(array(           
            'email'=>new mfValidatorEmail(),           
            'password'=>new mfValidatorString(),           
            'culture'=>new mfValidatorString(),            
          //  'promo'=>new mfValidatorString(array('required'=>false)),
        ));     
        $this->setOption('disabledCSRF',true);   
        $this->validatorSchema->setPostValidator(new UserGuardMobileValidator());
    }
    
    function getUser()
    {
        return current($this->values['profiles']);                        
    }
    
    function getProfiles()
    {
        return $this->values['profiles'];
    }
    
    function isProfilUnique()
    {        
        return   $this->getProfiles()->isUnique();
    }
        
    
    function getValues()
    {
        $values=array();
        $values['token']=$this->getToken();                
        $values['profiles']=$this->getProfiles()->getProfileNames();
        $values['status']="OK";
        return $values;
    }
}


