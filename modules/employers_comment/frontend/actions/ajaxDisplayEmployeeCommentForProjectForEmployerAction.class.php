<?php
 
class employers_comment_ajaxDisplayEmployeeCommentForProjectForEmployerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
       // $this>comment =        
    }
}

