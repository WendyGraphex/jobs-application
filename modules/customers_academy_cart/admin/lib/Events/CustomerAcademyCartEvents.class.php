<?php

class CustomerAcademyCartEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('cart'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            'customers_academy_cart_default_currency'=>new mfValidatorChoice(array('key'=>false,'choices'=>SiteCurrencyUtils::getCurrenciesForSelect())),
            'customers_academy_cart_format_reference'=>new mfValidatorString(),
            'customers_academy_cart_format_number'=>new mfValidatorString(),
        ));
        $form->getSettings()->add(array(
            'customers_academy_cart_format_reference'=>'CART-{id}',
            'customers_academy_cart_format_number'=>'0000'
                ));
        $form->getComponents()->set("20_00_customers_academy_cart","/customers_academy_cart/settings");
    }
       
}

