<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleNewForm.class.php";

class employers_project_ajaxNewProjectAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();         
        $this->form = new EmployerProjectI18nMultipleNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerProjectMultiple'));             
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerProjectMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployerProjectMultiple'));
        if ($this->form->isValid())
        {
           $this->form->getProject()->create();           
                       
           $messages->addInfo(__('Project has been created.'));          
           $this->forward($this->getModuleName(), 'ajaxListPartialProject');
        }   
        else
        {
          //  echo "KO";
           //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $messages->addError(__('Form has some errors.'));
        }          
    }

}




