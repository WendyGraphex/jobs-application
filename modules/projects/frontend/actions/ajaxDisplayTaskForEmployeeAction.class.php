<?php

class projects_ajaxDisplayTaskForEmployeeAction extends mfAction {                
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
           if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $this->item=$request->getRequestRequestParameter('task',new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser()));         
        $this->states=ProjectTaskState::getStatesForSelect();        
    }

}
