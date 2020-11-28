<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyCourseDocumentUploadForm.class.php";


class customers_academy_teacher_ajaxUploadCourseDocumentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isTeacherUser()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new CustomerAcademyCourseDocumentUploadForm($this->getUSer()->getGuardUser(),$request->getPostParameter('UploadCourseDocument'));
        $form->bind($request->getPostParameter('UploadCourseDocument'),$request->getFiles('UploadCourseDocument'));
        if ($form->isValid())
        {
          
            $this->document=new CustomerAcademyCourseDocument($form->getCourseI18n()->upload(),$this->getUser()->getGuardUser());
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



