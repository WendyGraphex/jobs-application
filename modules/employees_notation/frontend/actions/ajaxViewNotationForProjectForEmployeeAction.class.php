<?php

require_once __DIR__."/../locales/Forms/ProjectEmployeeNotationSendForm.class.php";
 
class employees_notation_ajaxViewNotationForProjectForEmployeeAction extends mfAction {        
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
        $this->form= new ProjectEmployeeNotationSendForm($this->getUser()->getGuardUser(),$this->project);           
    }
}

