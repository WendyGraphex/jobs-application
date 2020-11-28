<?php

class PaymentEmployeeZelleSettingsForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'phone'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
        ));
    }
}

class PaymentZelleEvents extends PaymentZelleEventsBase {
     
    
    static function setEmployeeSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_zelle'))
             return ;
        $form=$event->getSubject();                      
        $form->embedForm('zelle',new PaymentEmployeeZelleSettingsForm($form->getDefault('zelle')), array('required'=>false));      
        if (!$form->getDefault('zelle') && !$form->getSettings()->getZelle()->get('firstname') && !$form->getSettings()->getZelle()->get('lastname'))
        {      
            $form->getSettings()->getZelle()->getOptions()->add(array('lastname'=>$form->getEmployeeUser()->get('lastname'),
                                                                      'firstname'=>$form->getEmployeeUser()->get('firstname'),
                                                                    ));          
        }   
        if ($form->getDefault('method')!='zelle')
        {
            $form->zelle['phone']->setOption('required',false);
            $form->zelle['email']->setOption('required',false);
            $form->zelle['firstname']->setOption('required',false);
            $form->zelle['lastname']->setOption('required',false);
        }    
    }
       
    
    static function setEmployeeSettingsLoad(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_zelle'))
             return ;
        $form=$event->getSubject();
        if ($values=$form->getValue('zelle'))
        {
            if ($values['phone'] && $values['email'] && $values['firstname'] && $values['lastname'])
            {            
               $form->getSettings()->getZelle()->set('is_validated','YES');
             //  var_dump($form->getSettings()->getZelle());
            } 
            else
            {
               $form->getSettings()->getZelle()->set('is_validated','NO');  
            }             
        } 
       
    }
}
