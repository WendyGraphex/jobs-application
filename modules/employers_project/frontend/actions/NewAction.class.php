<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleNewForm.class.php";

class employers_project_NewAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->form = new EmployerProjectI18nMultipleNewForm($this->getUser()->getGuardUser());                         
    }

}




