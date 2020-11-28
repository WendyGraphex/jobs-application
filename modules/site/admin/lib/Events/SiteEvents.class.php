<?php


class SiteEvents {
    
 static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('site'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
             'default_currency'=>new mfValidatorChoice(array('key'=>true,'choices'=>SiteCurrencyUtils::getCurrenciesForSelect())) 
        ));
        $form->getSettings()->set('default_currency','USD');
        $form->getComponents()->set("00_00_site","/site/settings");
    }

}
