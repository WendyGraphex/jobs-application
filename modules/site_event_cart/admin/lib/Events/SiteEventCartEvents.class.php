<?php

class SiteEventCartEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('cart'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            'site_event_cart_default_currency'=>new mfValidatorChoice(array('key'=>false,'choices'=>SiteCurrencyUtils::getCurrenciesForSelect())),
            'site_event_cart_format_reference'=>new mfValidatorString(),
            'site_event_cart_format_number'=>new mfValidatorString(),
        ));
        $form->getSettings()->add(array(
            'site_event_cart_format_reference'=>'CART-{id}',
            'site_event_cart_format_number'=>'0000'
                ));
        $form->getComponents()->set("20_00_site_event_cart","/site_event_cart/settings");
    }
       
}

