<?php


class CartSigninForm extends mfForm {
    
    
      function configure() {
        if (!$this->hasDefaults())
            $this->setDefault('type','private');
        $this->setValidators(array(
            'type'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>array('private'=>__('Private'),'professional'=>__('Professional')),'empty_value'=>'private')),
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
            'password'=>new mfValidatorString(),
            'email'=>new mfValidatorString(),
            'gender'=>new mfValidatorChoice(array("choices"=>array(''=>__("Choose type"),"Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
        ));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $user=new CustomerUser(array('email'=>$values['email']));    
        if ($user->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('email'=>new mfValidatorError($this->email,__('Email already exists.'))));
        return $values;
    }
    
}

