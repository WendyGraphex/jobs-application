<?php

class PaymentEmployeeBankwireSettingsForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'iban'=>new mfValidatorString()
        ));
    }
}

class PaymentBankwireEvents extends PaymentBankwireEventsBase {
     
    
    static function setEmployeeSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_bankwire'))
             return ;
        $form=$event->getSubject();                      
        $form->embedForm('bankwire',new PaymentEmployeeBankwireSettingsForm($form->getDefault('bankwire')), array('required'=>false)); 
          if ($form->getDefault('method')!='bankwire')
        {         
            $form->bankwire['iban']->setOption('required',false);         
        } 
    }
       
    
    static function setEmployeeSettingsLoad(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_bankwire'))
             return ;
        $form=$event->getSubject();
        if ($values=$form->getValue('bankwire'))
        {
            if ($values['iban'])
            {            
               $form->getSettings()->getBankwire()->set('is_validated','YES');          
            } 
            else
            {
               $form->getSettings()->getBankwire()->set('is_validated','NO');  
            }             
        } 
       
    }
}
