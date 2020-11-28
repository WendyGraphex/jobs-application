<?php

class site_event_ajaxDeleteSpeakerUserAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $user=new mfValidatorInteger();
          $user_id=$user->isValid($request->getPostParameter('SiteEventSpeakerUser'));
          $user= new SiteEventSpeakerUser($user_id);
          if ($user->isLoaded())
          {    
            $user->delete();                    
            $response = array("action"=>"DeleteSpeakerUser","id" =>$user->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

