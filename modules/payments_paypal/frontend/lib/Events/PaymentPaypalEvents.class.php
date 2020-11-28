<?php

class PaymentEmployeePaypalSettingsForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'email'=>new mfValidatorEmail()
        ));
    }
}

class PaymentPayPalEvents extends PaymentPaypalEventsBase {
     
  
    
    static function setEmployeeSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_paypal'))
             return ;
        $form=$event->getSubject();                       
        $form->embedForm('paypal',new PaymentEmployeePaypalSettingsForm($form->getDefault('paypal')), array('required'=>false));        
         if ($form->getDefault('method')!='paypal')
        {         
            $form->paypal['email']->setOption('required',false);         
        }  
    }
       
    
    static function setEmployeeSettingsLoad(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_paypal'))
             return ;
        $form=$event->getSubject();
        if ($values=$form->getValue('paypal'))
        {
            if ($values['email'])
            {            
               $form->getSettings()->getPaypal()->set('is_validated','YES');          
            } 
            else
            {
               $form->getSettings()->getPaypal()->set('is_validated','NO');  
            }             
        } 
       
    }
}

