<?php

class projects_ajaxDisplayTaskForEmployerAction extends mfAction {                
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
           if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $this->item=$request->getRequestRequestParameter('task',new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser()));         
        $this->states=ProjectTaskState::getStatesForSelect();        
    }

}
