<?php


class CustomerAcademyStudentUserSigninForm extends mfForm {
    
    
      function configure() {        
        $this->setValidators(array(          
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
            'password'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),
            'gender'=>new mfValidatorChoice(array("choices"=>array(''=>__("Choose type"),"Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
        ));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $user=new CustomerAcademyStudentUser(array('email'=>$values['email']));    
        if ($user->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('email'=>new mfValidatorError($this->email,__('Email already exists.'))));
        return $values;
    }
    
}


