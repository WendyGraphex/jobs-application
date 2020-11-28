<?php

require_once __DIR__."/../locales/Forms/ProjectDocumentUploadForm.class.php";


class projects_documents_ajaxUploadDocumentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
       if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new ProjectDocumentUploadForm($this->getUSer()->getGuardUser(),$request->getPostParameter('UploadDocument'));
        $form->bind($request->getPostParameter('UploadDocument'),$request->getFiles('UploadDocument'));
        if ($form->isValid())
        {
         
            $this->document=new ProjectDocument($form->getTask(),$this->getUser()->getGuardUser());
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



