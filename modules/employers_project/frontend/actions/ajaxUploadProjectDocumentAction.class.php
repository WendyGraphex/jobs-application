<?php

require_once __DIR__."/../locales/Forms/EmployerUploadProjectDocumentForm.class.php";


class employers_project_ajaxUploadProjectDocumentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployerUploadProjectDocumentForm($this->getUSer()->getGuardUser(),$request->getPostParameter('UploadProjectDocument'));
        $form->bind($request->getPostParameter('UploadProjectDocument'),$request->getFiles('UploadProjectDocument'));
        if ($form->isValid())
        {
          
            $this->document=new EmployerProjectDocument($form->getProject()->upload(),$this->getUser()->getGuardUser());
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



