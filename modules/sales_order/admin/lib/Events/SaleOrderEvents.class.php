<?php

class SaleOrderEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales_order'))
             return ;
        $form=$event->getSubject();        
         $form->addValidators(array(                  
            'order_format_reference'=>new mfValidatorString(),
            'order_format_number'=>new mfValidatorString(),
            "order_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),             
           
        ));
        $form->getSettings()->add(array(
            'order_format_reference'=>'O{year}{month}{day}{id}',
            'order_format_number'=>'0000'
                ));       
        $form->getComponents()->set("30_sales_order","/sales_order/settings");
    }
      
                           
}

