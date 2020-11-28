<?php

require_once __DIR__."/../locales/Forms/UploadPictureEventNewForm.class.php";

class site_event_ajaxUploadPictureNewEventAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {   
          if (!$this->getUser()->isEventUser())             
                $this->forwardTo401Action();
          $form = new UploadPictureEventNewForm();
          $form->bind($request->getPostParameter('UploadPictureEvent'),$request->getFiles('UploadPictureEvent'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Event is invalid.'));
          } 
          
        $form->getEvent()->setPicture($form->getFile());
        $form->getEvent()->upload();      
        $response = array("action"=>"UploadPictureNewEvent",   
                          "url"=>$form->getEvent()->getPicture()->getMedium()->getUrl(),
                          "id" =>$form->getEvent()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


