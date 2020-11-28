<?php

class EmployeeAbuseAdvertI18nForm extends mfForm {
    
    protected $advert_i18n=null;
    
    function configure() {
        $this->setValidators(array(
            'url'=>new mfValidatorString(),
            'lang'=>new languagesExistsValidator(array(),'frontend'),
            'message'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
            'type_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>CustomerAbuseType::getAbuseTypesForSelect()->unshift(array(''=>__('Select a type of abuse')))))
        ));
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $this->advert_i18n=new EmployeeAdvertI18n(array('url'=>$values['url'],'lang'=>$values['lang']));    
        if ($this->advert_i18n->isNotLoaded())
            throw new mfValidatorErrorSchema($validator,array('invalid'=>new mfValidatorError($this->url,__('Advert is invalid'))));
        return $values;
    }
    
    
    function getValues()
    {
        $values= parent::getValues();
        $values['advert_i18n_id']=$this->getAdvertI18n();
        return $values;
    }
    
    function getAdvertI18n()
    {
        return $this->advert_i18n;
    }
}
