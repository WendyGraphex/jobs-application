<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleNewForm.class.php";

class employees_ajaxWantAJobAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) { 
        if (!$this->getUser()->isEmployee())
                $this->forwardTo401Action(); 
        $messages = mfMessages::getInstance();            
        $this->form = new EmployeeAdvertI18nMultipleNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployeeAdvertMultiple'));      
    }
    
   
}


