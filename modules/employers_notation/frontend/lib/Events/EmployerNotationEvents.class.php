<?php

class EmployerNotationEvents {
     
 
     
     static function updateEmployerForEmployeeAdvertNotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_notation'))
             return ;
        $form = $event->getSubject();      
        //$form =new AddEmployeeNotationByEmployerForm();     
        $employer_advert_i18n_notation = new EmployerAdvertI18nNotation(array('advert_i18n'=>$form->getEmployeeAdvertI18n(),'employer'=>$form->getEmployerUser(),'work'=>$form->getWork()));
        $employer_advert_i18n_notation->create();
        
        $employer_criteria_notation = new EmployerCriteriaNotation(array('employer'=>$form->getEmployerUser()));
        $employer_criteria_notation->create();  
    }
    
    
      static function updateEmployerForEmployerAdvertNotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_notation'))
             return ;
        $form = $event->getSubject();
        //$form =new AddEmployerNotationByEmployeeForm();
        $employer_advert_i18n_notation = new EmployerAdvertI18nNotation(array('advert_i18n'=>$form->getEmployerAdvertI18n(),'employer'=>$form->getEmployerUser(),'work'=>$form->getWork()));
        $employer_advert_i18n_notation->create();
        
        $employer_criteria_notation = new EmployerCriteriaNotation(array('employer'=>$form->getEmployerUser()));
        $employer_criteria_notation->create();                        
    }
    
    
     
}

