<?php

 
class employers_messager_ajaxSendMessageToEmployerDialogAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forward('employees','ajaxLoginDialog');        
        $messages= mfMessages::getInstance();     
        $this->employer= new EmployerUser(new mfString($request->getPostParameter('EmployerMessageDialog')));      
        $this->max_characters=500;
    }
    
   
}



