<?php

require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleViewForm.class.php";

class employers_project_ajaxSaveProjectAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->project = new EmployerProject($request->getPostParameter('EmployerProject'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;
        $this->form = new EmployerProjectI18nMultipleViewForm($this->project,$request->getPostParameter('EmployerProjectMultiple'));   
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerProjectMultiple'))
            return ;
        $this->form->bind($request->getPostParameter('EmployerProjectMultiple'));
        if ($this->form->isValid())
        {
           $this->project->updateProjectsI18n();
           $messages->addInfo(__('Project has been updated.'));          
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




