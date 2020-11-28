<?php


 class SiteCountryAddForm extends mfForm {
 

    function configure()
    {
          if (!$this->hasDefaults())
               $this->setDefault('countries', SiteCountry::getCountriesByCodeForSelect()->toArray());
          $this->setValidators(array(
              'countries'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'choices'=> mfCountryInfoI18n::getI18nCountries()->asort()))
          ));
    }
    
    
    function getCountries()
    {
        return $this['countries']->getArray();
    }
 
}


