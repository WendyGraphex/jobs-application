<?php

 
class projects_ajaxDisplayProjectForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
    }
    
   
}


