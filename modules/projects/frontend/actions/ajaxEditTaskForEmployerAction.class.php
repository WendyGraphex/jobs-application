<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskEditForm.class.php";

class projects_ajaxEditTaskForEmployerAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
           if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());         
        $this->form= new ProjectTaskEditForm($this->item);       
    }

}

