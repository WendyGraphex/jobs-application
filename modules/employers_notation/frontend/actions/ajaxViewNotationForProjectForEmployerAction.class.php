<?php

require_once __DIR__."/../locales/Forms/ProjectEmployerNotationSendForm.class.php";
 
class employers_notation_ajaxViewNotationForProjectForEmployerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
        $this->form= new ProjectEmployerNotationSendForm($this->getUser()->getGuardUser(),$this->project);             
    }
}

