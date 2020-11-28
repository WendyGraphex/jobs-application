<?php

class PaymentEmployeeWuSettingsForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(            
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
        ));
    }
}

class PaymentWuEvents extends PaymentWuEventsBase {
     
    
    static function setEmployeeSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_wu'))
             return ;        
        $form=$event->getSubject();                             
        $form->embedForm('wu',new PaymentEmployeeWuSettingsForm($form->getDefault('wu')), array('required'=>false));             
        if (!$form->getDefault('wu') && !$form->getSettings()->get('firstname') && !$form->getSettings()->get('lastname'))
        {      
            $form->getSettings()->getWu()->getOptions()->add(array('lastname'=>$form->getEmployeeUser()->get('lastname'),
                                                                      'firstname'=>$form->getEmployeeUser()->get('firstname'),
                                                                    ));          
        }   
        if ($form->getDefault('method')!='wu')
        {         
            $form->wu['firstname']->setOption('required',false);
            $form->wu['lastname']->setOption('required',false);
        }    
    }
       
    
    static function setEmployeeSettingsLoad(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_wu'))
             return ;
        $form=$event->getSubject();
        if ($values=$form->getValue('wu'))
        {
            if ($values['firstname'] && $values['lastname'])
            {            
               $form->getSettings()->getWu()->set('is_validated','YES');          
            } 
            else
            {
               $form->getSettings()->getWu()->set('is_validated','NO');  
            }             
        } 
       
    }
}
