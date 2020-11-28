<?php

/*
 * Employer => note Employee
 */
require_once __DIR__."/../locales/Forms/AddEmployeeNotationByEmployerForm.class.php";
require_once __DIR__."/../locales/Forms/AddEmployeeNotationForm.class.php";

class employers_notation_ajaxAddEmployeeNotationAction extends mfAction {
    
        
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isEmployerUser()) 
             $this->forwardTo401Action();     
       $form = new AddEmployeeNotationForm($this->getUser()->getGuardUser());
       $form->bind($request->getPostParameter('EmployeeReview'));
       if ($form->isValid())
       {        
           $this->employee=$form->getEmployeeUser();
           $this->advert_i18n=$form->getAdvertI18n();
           $this->form = new AddEmployeeNotationByEmployerForm();          
           return ;
       }       
       else
       {
           var_dump($form->getErrorSchema()->getErrorsMessage());
       }              
    }
}

