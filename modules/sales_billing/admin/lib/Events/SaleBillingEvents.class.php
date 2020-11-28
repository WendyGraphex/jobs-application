<?php

class SaleBillingEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales_billing'))
             return ;
         $form=$event->getSubject();        
         $form->addValidators(array(                  
            'billing_format_reference'=>new mfValidatorString(),
            'billing_format_number'=>new mfValidatorString(),
            "billing_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),            
        ));
        $form->getSettings()->add(array(
            'billing_format_reference'=>'B{year}{month}{day}{id}',
            'billing_format_number'=>'0000'
                ));       
        $form->getComponents()->set("20_00_sales_billing","/sales_billing/settings");
    }
       
}

