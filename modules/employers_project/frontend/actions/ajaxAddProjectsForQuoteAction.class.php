<?php

require_once __DIR__."/../locales/Forms/EmployerProjectAddForQuoteForm.class.php";
    
 
class employers_project_ajaxAddProjectsForQuoteAction extends mfAction
{

    function execute(mfWebRequest $request)
    {              
        $messages = mfMessages::getInstance(); 
        if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();                
        $this->form=new EmployerProjectAddForQuoteForm($this->getUser()->getGuardUser(),$request->getPostParameter('AddEmployerProject'));
        $this->form->bind($request->getPostParameter('AddEmployerProject'));          
    }

}



