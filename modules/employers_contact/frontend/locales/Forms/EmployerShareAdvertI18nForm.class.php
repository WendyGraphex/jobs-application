<?php

class EmployerShareAdvertI18nForm extends mfForm {
    
    protected $advert_i18n=null;
    
    function configure() {
        $this->setValidators(array(
            'url'=>new mfValidatorString(),
            'lang'=>new languagesExistsValidator(array(),'frontend'),
            'message'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
            'phone'=>new mfValidatorString(),
        ));
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $this->advert_i18n=new EmployerAdvertI18n(array('url'=>$values['url'],'lang'=>$values['lang']));    
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
