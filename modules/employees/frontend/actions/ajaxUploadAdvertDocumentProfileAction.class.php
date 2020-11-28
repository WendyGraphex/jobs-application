<?php

require_once __DIR__."/../locales/Forms/EmployeeUploadAdvertDocumentForm.class.php";


class employees_ajaxUploadAdvertDocumentProfileAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
     $employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user');    
        if (!$employee_user)
            $this->forwardTo401Action ();     
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployeeUploadAdvertDocumentForm($employee_user,$request->getPostParameter('UploadAdvertDocument'));
        $form->bind($request->getPostParameter('UploadAdvertDocument'),$request->getFiles('UploadAdvertDocument'));
        if ($form->isValid())
        {
          
            $this->document=new EmployeeAdvertDocument($form->getAdvert()->upload(),$form->getUser());
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



