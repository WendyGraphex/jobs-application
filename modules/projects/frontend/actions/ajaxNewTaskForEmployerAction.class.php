<?php

 require_once __DIR__."/../locales/Forms/ProjectTaskNewForEmployerForm.class.php"; 

class projects_ajaxNewTaskForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();             
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;   
        $this->form=new ProjectTaskNewForEmployerForm($this->project,$request->getPostParameter('ProjectTask'));
        $this->item=new ProjectTask();
        if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectTask'))
            return ;      
        $this->form->bind($request->getPostParameter('ProjectTask'));
        if ($this->form->isValid())
        {
             $this->item->add($this->form->getValues());
             $this->item->create();
             $messages->addInfo(__('Task has been created.')); 
             $request->addRequestParameter('project', $this->project);
             $this->forward($this->getModuleName(), 'ajaxListPartialTaskForProjectForEmployer');
        }
        else
        {
           $this->item->add($request->getPostParameter('ProjectTask'));
           $messages->addError(__('Form has some errors.'));
        }    
       
    }
    
   
}

