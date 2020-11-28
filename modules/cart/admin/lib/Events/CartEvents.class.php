<?php

class CartEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('cart'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            'cart_default_currency'=>new mfValidatorChoice(array('key'=>false,'choices'=>SiteCurrencyUtils::getCurrenciesForSelect())),
            'cart_format_reference'=>new mfValidatorString(),
            'cart_format_number'=>new mfValidatorString(),
        ));
        $form->getSettings()->add(array(
            'cart_format_reference'=>'CART-{id}',
            'cart_format_number'=>'0000'
                ));       
        $form->getComponents()->set("20_00_cart","/cart/settings");
    }
       
}

