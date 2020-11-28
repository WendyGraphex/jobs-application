<?php

 require_once __DIR__."/../locales/Forms/ProjectTaskViewForm.class.php"; 

class projects_ajaxSaveTaskForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                   
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());
        $this->form=new ProjectTaskViewForm($request->getPostParameter('ProjectTask'));      
        if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectTask') || $this->item->isNotLoaded())
            return ;      
        $this->form->bind($request->getPostParameter('ProjectTask'));
        if ($this->form->isValid())
        {
             $this->item->add($this->form->getValues());
             $this->item->create();
             $messages->addInfo(__('Task has been updated.')); 
             $request->addRequestParameter('project', $this->item->getProject());
             $this->forward($this->getModuleName(), 'ajaxListPartialTaskForProjectForEmployer');
        }
        else
        {
           $messages->addError(__('Form has some errors.'));
        }    
       
    }
    
   
}

