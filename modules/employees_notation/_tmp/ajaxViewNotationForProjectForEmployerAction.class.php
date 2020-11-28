<?php

 
class employees_notation_ajaxViewNotationForProjectForEmployerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
       
    }
}

