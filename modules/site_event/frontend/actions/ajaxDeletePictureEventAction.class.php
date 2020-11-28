<?php


class site_event_ajaxDeletePictureEventAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {   
          if (!$this->getUser()->isEventUser())             
                $this->forwardTo401Action();
          $validator=new mfValidatorInteger();
          $event= new SiteEvent(array('id'=>$validator->isValid($request->getPostParameter('SiteEvent'))),$this->getUser()->getGuardUser());
          if ($event->isNotLoaded())
             throw new mfException(__('Event is invalid.'));
          $event->getPicture()->remove(); 
          $response = array("action"=>"DeletePictureEvent","id" =>$event->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
