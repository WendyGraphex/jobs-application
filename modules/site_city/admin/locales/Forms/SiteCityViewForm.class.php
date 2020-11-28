<?php


require_once dirname(__FILE__)."/SiteCityI18nForm.class.php";


class SiteCityViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('city', new SiteCityBaseForm($this->getDefault('city')));
        $this->embedForm('city_i18n', new SiteCityI18nForm($this->getDefault('city_i18n')));
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
    
    function getValuesForCity()
    {
        $values= $this['city']->getValue();
        unset($values['icon']);
        return $values;
    }
    
    function getValuesForCityI18n()
    {
        return $this['city_i18n']->getValue();      
    }
}
