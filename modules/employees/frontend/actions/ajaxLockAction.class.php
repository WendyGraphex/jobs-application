<?php
 

class employees_ajaxLockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();   
           if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
        $this->getUser()->getGuardUser()->lock();                        
        return array('action'=>'Lock');
    }
    
   
}


