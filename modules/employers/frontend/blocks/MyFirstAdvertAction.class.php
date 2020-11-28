<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleNewForm.class.php";

class employers_MyFirstAdvertActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
        $messages = mfMessages::getInstance();         
        $this->form = new EmployerAdvertI18nMultipleNewForm($this->getUser()->getGuardUser()); 
    } 
    
    
}
