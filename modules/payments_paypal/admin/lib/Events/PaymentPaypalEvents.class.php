<?php

class PaypalSettingsMultipleForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'mode'=>new mfValidatorString(),
            'client'=>new mfValidatorString(),
            'secret'=>new mfValidatorString(),
            'payer'=>new mfValidatorString(),
            'is_default'=>new mfValidatorBoolean(),
           // 'mode'=>new mfValidatorChoice(array('key'=>true,'choices'=>array('TEST'=>__('sandbox'),'PROD'=>__('Production'))))
        ));
    }
}
class PaymentPaypalEvents extends PaymentPaypalEventsBase {
     
 
    static function setPaymentSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_paypal'))
             return ;
        $form=$event->getSubject();
        if (!$form->getDefault('paypal_settings'))
        {
           $form->setDefault('paypal_settings',PaymentPaypalSettings::getModes()->toArray()); 
        }         
        $form->embedFormForEach('paypal_settings',new PaypalSettingsMultipleForm($form->getDefault('paypal_settings')), $form->getDefault('paypal_settings')?count($form->getDefault('paypal_settings')):1,array('required'=>false));
        $form->setValidator('paypal_settings_mode',new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>PaymentPaypalSettings::getModesForSelect())));
        //$form->getComponents()->set("20_00_payments","/payments_paypal/settings");       
    }
       
    
    static function setPaymentSettingsUpdate(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_paypal'))
             return ;
        $form=$event->getSubject();
        PaymentPaypalSettings::updateModes($form['paypal_settings']->getArray(),$form['paypal_settings_mode']->getValue());
        
    }
}

