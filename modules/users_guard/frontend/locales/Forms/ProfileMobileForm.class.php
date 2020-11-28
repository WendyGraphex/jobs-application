<?php


class ProfileMobileForm extends mfFormMobile {
    
    protected $profiles=null;
    
    function __construct($profiles,$default=array(),$messages=array())
    {
        $this->profiles=$profiles;
        parent::__construct($default,$messages);
    }
    
    function configure()
    {         
        $this->setValidators(array(           
            'profile'=>new mfValidatorChoice(array('choices'=>$this->profiles->getProfilesForSelect(),'key'=>true)),                      
        ));             
    }
    
    function getUser()
    {
        return $this->profiles->getProfile($this['profile']->getValue());                        
    }
    
   
    
    function getValues()
    {
        $values=array();
        $values['token']=$this->getToken();                       
        $values['status']="OK";
        return $values;
    }
}


