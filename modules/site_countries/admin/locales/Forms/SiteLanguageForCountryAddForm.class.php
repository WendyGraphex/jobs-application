<?php


class SiteLanguageForCountryAddForm extends mfForm {
    
    protected $country=null;
    
    function __construct(SiteCountry $country,$defaults = array(), $options = array()) {
        $this->country=$country;        
        parent::__construct($defaults, $options);
    }
    
    function getCountry()
    {
        return $this->country;
    }
    
    function configure() {
        if (!$this->hasDefaults())
        {                                
            $this->setDefault('languages',$this->getCountry()->getLanguages()->getKeys());
        }    
        $this->setValidators(array(
              'languages'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'multiple'=>true,'choices'=> LanguageUtilsAdmin::getI18nLanguagesFrontendList()))            
        ));
    }
    
    function getLanguages()
    {
        return $this['languages']->getArray();
    }
}
