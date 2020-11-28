<?php

class SiteEventOrderEvents extends SiteEventOrderEventsBase {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('site_event_order'))
             return ;
        $form=$event->getSubject();        
         $form->addValidators(array(                  
            'site_event_order_format_reference'=>new mfValidatorString(),
            'site_event_order_format_number'=>new mfValidatorString(),
            "site_event_order_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),             
           
        ));
        $form->getSettings()->add(array(
            'site_event_order_format_reference'=>'O{year}{month}{day}{id}',
            'site_event_order_format_number'=>'0000'
                ));       
        $form->getComponents()->set("30_site_event_order","/site_event_order/settings");
    }
      
                      
}

