<?php
 
class employees_comment_ajaxDisplayEmployerCommentForProjectForEmployeeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
               
    }
}

