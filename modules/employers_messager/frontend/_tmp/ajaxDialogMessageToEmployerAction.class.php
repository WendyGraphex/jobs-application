<?php

require_once __DIR__."/../locales/Forms/DialogMessageToEmployerForm.class.php";
        
class employers_messager_ajaxDialogMessageToEmployerAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
           $this->forwardTo401Action ();                   
        $this->form = new DialogMessageToEmployerForm($this->getUser()->getGuardUser());
        $this->form->bind($request->getPostParameter('EmployerMessage'));       
    }
}

