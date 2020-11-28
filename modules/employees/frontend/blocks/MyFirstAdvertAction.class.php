<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertI18nMultipleNewForm.class.php";

class employees_MyFirstAdvertActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
        $messages = mfMessages::getInstance();         
        $this->form = new EmployeeAdvertI18nMultipleNewForm($this->getUser()->getGuardUser()); 
    } 
    
    
}
