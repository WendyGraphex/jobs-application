<?php

require_once __DIR__."/../locales/Forms/EmployerUserViewForm.class.php";

class employers_ajaxViewUserAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action();            
        $messages = mfMessages::getInstance(); 
            // var_dump($request->getPostParameter('Employer'));
        $this->form= new EmployerUserViewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerUser'));             
        $this->item=new EmployerUser($request->getPostParameter('EmployerUser'),$this->getUser()->getGuardUser());        
    }
}