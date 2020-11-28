<?php

require_once __DIR__."/../locales/Forms/EmployerPictureContentUploadForm.class.php";


class employers_ajaxUploadPictureContentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployerPictureContentUploadForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerPictureContentUpload'));
        $form->bind($request->getPostParameter('EmployerPictureContentUpload'),$request->getFiles('EmployerPictureContentUpload'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
       
        $this->getUser()->getGuardUser()->getContent()->setPicture($form->getFile())->save();    
        $response = array("action"=>"UploadPictureContent",   
                          "url"=>$this->getUser()->getGuardUser()->getContent()->getPicture()->getMedium()->getUrl(),
                        );      
      } 
      catch (mfException $ex) 
      {
         $response=$ex->getMessage();
      }      
       return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}



