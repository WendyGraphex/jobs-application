<?php

require_once __DIR__."/../locales/Forms/EmployeeUploadAdvertDocumentForm.class.php";


class employees_ajaxUploadAdvertDocumentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployeeUploadAdvertDocumentForm($this->getUSer()->getGuardUser(),$request->getPostParameter('UploadAdvertDocument'));
        $form->bind($request->getPostParameter('UploadAdvertDocument'),$request->getFiles('UploadAdvertDocument'));
        if ($form->isValid())
        {
          
            $this->document=new EmployeeAdvertDocument($form->getAdvert()->upload(),$this->getUser()->getGuardUser());
            $this->document->create($form->getFile());
            
            return ;
        } 
        $response['errors']=$form->getErrorSchema()->getErrorsMessage(); 
      } 
      catch (mfException $ex) 
      {
         $response=$ex->getMessage();
      }      
      $this->getController()->setRenderMode(mfView::RENDER_JSON);             
      return $response; 
    }

}



