<?php

require_once __DIR__."/../locales/Forms/EmployeePictureContentUploadForm.class.php";


class employees_ajaxUploadPictureContentAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
      $messages = mfMessages::getInstance();   
      try 
      {         
        $form=new EmployeePictureContentUploadForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployeePictureContentUpload'));
        $form->bind($request->getPostParameter('EmployeePictureContentUpload'),$request->getFiles('EmployeePictureContentUpload'));
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



