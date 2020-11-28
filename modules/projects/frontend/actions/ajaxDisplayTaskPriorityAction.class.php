<?php


class projects_ajaxDisplayTaskPriorityAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();          
        $this->item=$request->getRequestParameter('task',new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser()));                 
    }

}
