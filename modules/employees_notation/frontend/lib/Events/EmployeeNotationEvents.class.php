<?php

class EmployeeNotationEvents {
     
    // Employee Notation by Employer for EmployeeAdvert
     
     static function updateEmployeeForEmployeeAdvertNotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_notation'))
             return ;
        $form = $event->getSubject();
      //  $form = new AddEmployeeNotationByEmployerForm();
       
        $employee_advert_i18n_notation = new EmployeeAdvertI18nNotation(array('advert_i18n'=>$form->getEmployeeAdvertI18n(),'employee'=>$form->getEmployeeUser(),'work'=>$form->getWork()));
        $employee_advert_i18n_notation->create();
        
        $employee_criteria_notation = new EmployeeCriteriaNotation(array('employee'=>$form->getEmployeeUser()));
        $employee_criteria_notation->create(); 
    }
    
       
      static function updateEmployeeForEmployerAdvertNotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_notation'))
             return ;
        $form = $event->getSubject();        
        //$form =new AddEmployerNotationByEmployeeForm();
        $employee_advert_i18n_notation = new EmployeeAdvertI18nNotation(array('advert_i18n'=>$form->getEmployerAdvertI18n(),'employee'=>$form->getEmployeeUser(),'work'=>$form->getWork()));
        $employee_advert_i18n_notation->create();
        
        $employer_criteria_notation = new EmployeeCriteriaNotation(array('employee'=>$form->getEmployeeUser()));
        $employer_criteria_notation->create();                      
    }
    
    
     
}

