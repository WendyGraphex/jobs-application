<?php

class EmployeeForgotPasswordChangeForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'password' => new mfValidatorString(),
            'repassword' => new mfValidatorString(),
            'key'=> new ObjectExistsValidator('EmployeeForgotPassword',array('key'=>false))
        ));        
       $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array('operator_error'=>true),array("invalid"=>__("password and repassword must be equal."))));
    }
    
    
    
    function getForgotPassword()
    {
        return $this['key']->getValue();
    }
    
    function getEmployee()
    {
        return $this->getForgotPassword()->getEmployee()->set('password',$this['password']->getValue());        
    }
   
}