<?php

class SaleEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
              'tax_rate'=>new mfValidatorChoice(array('key'=>true,'choices'=>SaleTaxUtils::getTaxesForSelect()->unshift(array(''=>'')))) 
        ));
       // $form->getSettings()->set('tax_rate',0.2);
        $form->getComponents()->set("20_00_sales","/sales/settings");
    }
       
}

