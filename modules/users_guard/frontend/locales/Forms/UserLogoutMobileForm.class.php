<?php


class UserLogoutMobileForm extends mfFormMobile {
    
    
    function configure()
    {         
        $this->setValidators(array(           
            
        ));                  
    }
    
    
    function getValues()
    {
        $values=array();
        $values['token']=$this->getToken();                       
        $values['status']="OK";
        return $values;
    }
}


