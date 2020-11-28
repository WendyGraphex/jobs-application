<?php

class EmployeeWorkEvents extends EmployeeWorkEventsBase {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_work'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            'work_format_reference'=>new mfValidatorString(),
            'work_format_number'=>new mfValidatorString(),   
            
            'work_payment_request_format_reference'=>new mfValidatorString(),
            'work_payment_request_format_number'=>new mfValidatorString(), 
            'work_payment_day'=>new mfValidatorChoice(array('choices'=>Day::getWeekDaysNameI18n(),'key'=>true)), 
            'work_payment_shift'=>new mfValidatorChoice(array('choices'=>Day::getInstance()->range(1,3)->toArray(),'key'=>true)), 
            'work_payment_hour'=>new mfValidatorChoice(array('choices'=>Time::getInstance()->range(0,23)->toArray(),'key'=>true)), 
        ));
        $form->getSettings()->add(array(
            'work_format_reference'=>'W{year}{month}{day}{id}',
            'work_format_number'=>'0000',
            
             'work_payment_request_format_reference'=>'PW{year}{month}{day}{id}',
            'work_payment_request_format_number'=>'0000',
            'work_payment_shift'=>3,
            'work_payment_hour'=>12
                ));         
        $form->getComponents()->set("35_00_works","/employees_work/settings");
    }
       
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_work'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "work_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_work","/employees_work/emails");
    } 
    
}

