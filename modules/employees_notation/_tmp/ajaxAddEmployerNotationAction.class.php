<?php

/*
 * Employer => note Employee
 */
require_once __DIR__."/../locales/Forms/AddEmployerNotationByEmployeeForm.class.php";
require_once __DIR__."/../locales/Forms/AddEmployerNotationForm.class.php";


class employees_notation_ajaxAddEmployerNotationAction extends mfAction {
    
        
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isEmployee()) 
             $this->forwardTo401Action();     
       $form = new AddEmployerNotationForm($this->getUser()->getGuardUser());
       $form->bind($request->getPostParameter('EmployerReview'));
       if ($form->isValid())
       {        
           $this->employer=$form->getEmployerUser();
           $this->advert_i18n=$form->getEmployeeAdvertI18n();
           $this->form = new AddEmployerNotationByEmployeeForm();          
           return ;
       }       
       else
       {
           var_dump($form->getErrorSchema()->getErrorsMessage());
       }              
    }
}

