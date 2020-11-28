<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleNewForm.class.php";

class employers_project_ajaxCreateProjectForQuoteAction extends mfAction
{

    function execute(mfWebRequest $request)
    {              
        $messages = mfMessages::getInstance(); 
         if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();         
        $this->form = new EmployerProjectI18nMultipleNewForm($this->getUser()->getGuardUser()); //,$request->getPostParameter('EmployerProjectMultiple'));                         
    }

}



