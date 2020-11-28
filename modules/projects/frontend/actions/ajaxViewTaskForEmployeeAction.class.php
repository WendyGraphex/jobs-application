<?php

 require_once __DIR__."/../locales/Forms/ProjectTaskViewForm.class.php"; 

class projects_ajaxViewTaskForEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                     
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());
        $this->form=new ProjectTaskViewForm($request->getPostParameter('ProjectTask'));      
         
    }
    
   
}

