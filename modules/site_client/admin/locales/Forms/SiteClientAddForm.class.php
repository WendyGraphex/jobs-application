<?php


 class SiteClientAddForm extends mfForm {
 

    function configure()
    {
          if (!$this->hasDefaults())
               $this->setDefault('clients', SiteClient::getFrontendClientsByLangForSelect()->toArray());
          $this->setValidators(array(
              'clients'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'choices'=> LanguageUtils::getFrontendLanguagesForSelect()))
          ));
    }
    
    
    function getClients()
    {
        return $this['clients']->getArray();
    }
 
}


