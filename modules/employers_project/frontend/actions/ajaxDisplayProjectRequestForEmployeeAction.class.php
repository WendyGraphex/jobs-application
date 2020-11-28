<?php
require_once __DIR__."/../locales/Forms/EmployerProjectI18nMultipleViewForm.class.php";

class employers_project_ajaxDisplayProjectRequestForEmployeeAction extends mfAction {
                 
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();     
        $this->project = new EmployerProject($request->getPostParameter('EmployeeProjectRequest'),$this->getUser()->getGuardUser());        
        //$this->form = new EmployerProjectI18nMultipleViewForm($this->project,$request->getPostParameter('EmployeeProjectRequest'));
        $this->form = new EmployerProjectI18nMultipleViewForm($this->project,$request);
    }    
   
}


