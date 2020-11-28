<?php

require_once __DIR__."/../locales/Forms/CustomerEmployerMessageUploadFileForm.class.php";

class employers_messager_ajaxUploadFileForMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
      $messages= mfMessages::getInstance();        
      $this->form=new  CustomerEmployerMessageUploadFileForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerEmployerMessage'));
      $this->form->bind($request->getPostParameter('CustomerEmployerMessage'),$request->getFiles('CustomerEmployerMessage'));
      if ($this->form->isValid())
      {         
          $this->form->getMessage()->create();                   
          $file = new CustomerEmployerMessageFile($this->form->getMessage());
          $file->create($this->form->getFile());        
      } 
      else
      {
          var_dump($this->form->getErrorSchema()->getErrorsMessage());
      }                   
    }
    
   
}


