<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleViewForm.class.php";

class employers_project_ajaxViewProjectAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->project = new EmployerProject($request->getPostParameter('EmployerProject'),$this->getUser()->getGuardUser());        
        $this->form = new EmployerProjectI18nMultipleViewForm($this->project,$request->getPostParameter('EmployerProjectMultiple'));        
    }

}




