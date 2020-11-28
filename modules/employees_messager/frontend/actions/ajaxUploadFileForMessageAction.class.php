<?php

require_once __DIR__."/../locales/Forms/CustomerEmployeeMessageUploadFileForm.class.php";

class employees_messager_ajaxUploadFileForMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
      $messages= mfMessages::getInstance();        
      $this->form=new  CustomerEmployeeMessageUploadFileForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerEmployeeMessage'));
      $this->form->bind($request->getPostParameter('CustomerEmployeeMessage'),$request->getFiles('CustomerEmployeeMessage'));
      if ($this->form->isValid())
      {         
          $this->form->getMessage()->create();                   
          $file = new CustomerEmployeeMessageFile($this->form->getMessage());
          $file->create($this->form->getFile());        
      } 
      else
      {
          var_dump($this->form->getErrorSchema()->getErrorsMessage());
      }                   
    }
    
   
}


