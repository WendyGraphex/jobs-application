<?php


 class SiteLanguageAddForm extends mfForm {
 

    function configure()
    {
          if (!$this->hasDefaults())
               $this->setDefault('languages', LanguageUtils::getFrontendLanguagesByCodeForSelect()->toArray());
          $this->setValidators(array(
              'languages'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'choices'=> mfLanguageInfoI18n::getI18nLanguages()->asort()))
          ));
    }
    
    
    function getLanguages()
    {
        return $this['languages']->getArray();
    }
 
}


