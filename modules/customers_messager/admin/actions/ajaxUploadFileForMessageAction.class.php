<?php

require_once __DIR__."/../locales/Forms/CustomerMessageUploadFileForm.class.php";

class employees_messager_ajaxUploadFileForMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                  
      $messages= mfMessages::getInstance();        
      $this->form=new  CustomerMessageUploadFileForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerMessage'));
      $this->form->bind($request->getPostParameter('CustomerMessage'),$request->getFiles('CustomerMessage'));
      if ($this->form->isValid())
      {         
          $this->form->getMessage()->create();                   
          $file = new CustomerMessageFile($this->form->getMessage());
          $file->create($this->form->getFile());        
      } 
      else
      {
          var_dump($this->form->getErrorSchema()->getErrorsMessage());
      }                   
    }
    
   
}


