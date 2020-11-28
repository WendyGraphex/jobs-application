<?php

class employees_work_ajaxDialogPayAllForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {          
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();         
        $this->project=$request->getRequestParameter('project',new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser()));    
        if ($this->project->isNotLoaded())
            $this->forwardTo401Action();     
    }
    
   
}



