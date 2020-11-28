<?php

require_once __DIR__."/../locales/Forms/EmployerUploadAdvertDocumentForm.class.php";


class employers_ajaxUploadAdvertDocumentProfileAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
     $employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user');    
      if (!$employer_user)
            $this->forwardTo401Action ();     
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployerUploadAdvertDocumentForm($employer_user,$request->getPostParameter('UploadAdvertDocument'));
        $form->bind($request->getPostParameter('UploadAdvertDocument'),$request->getFiles('UploadAdvertDocument'));
        if ($form->isValid())
        {
          
            $this->document=new EmployerAdvertDocument($form->getAdvert()->upload(),$form->getUser());
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



