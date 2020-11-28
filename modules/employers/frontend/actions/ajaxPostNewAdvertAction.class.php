<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleNewForm.class.php";

class employers_ajaxPostNewAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {      
             if (!$this->getUser()->isEmployerUser())
                $this->forwardTo401Action();     
        $messages = mfMessages::getInstance();            
        $this->form = new EmployerAdvertI18nMultipleNewForm($this->getUser()->getGuardUser());      
    }
    
   
}


