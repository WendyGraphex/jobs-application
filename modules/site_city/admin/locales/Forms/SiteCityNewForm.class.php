<?php


class SiteCityNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('city_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('city', new SiteCityBaseForm($this->getDefault('city')));
        $this->embedForm('city_i18n', new SiteCityI18nBaseForm($this->getDefault('city_i18n')));
        $this->city->addValidator('country_id',new mfValidatorChoice(array('key'=>true,'choices'=>SiteCountry::getActiveCountriesI18nForSelect()->unshift(array(''=>__("Choose a country"))))));
        unset($this->city_i18n['id'],$this->city['id']);
    }
    
    function getIcon()
    {
        return $this['city']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['city']['icon']->hasValue();
    }
}

