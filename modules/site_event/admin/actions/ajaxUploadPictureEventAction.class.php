<?php

require_once __DIR__."/../locales/Forms/UploadPictureEventForm.class.php";


class site_event_ajaxUploadPictureEventAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $event=new SiteEvent($request->getPostParameter('SiteEvent'));
        if ($event->isNotLoaded())
            throw new mfException(__('Event is invalid.'));
        $form=new UploadPictureEventForm($request->getPostParameter('UploadPictureEvent'));
        $form->bind($request->getPostParameter('UploadPictureEvent'),$request->getFiles('UploadPictureEvent'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $event->setPicture($form->getFile());
        $event->save();    
        $response = array("action"=>"UploadPictureEvent",   
                          "url"=>$event->getPicture()->getMedium()->getUrl(),
                          "id" =>$event->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


