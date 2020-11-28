<?php

require_once __DIR__."/../locales/Forms/ProjectEmployerCommentSendForm.class.php";
 
class employers_comment_ajaxViewCommentForProjectForEmployeeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
        $this->form= new ProjectEmployerCommentSendForm($this->getUser()->getGuardUser(),$this->project);             
    }
}

