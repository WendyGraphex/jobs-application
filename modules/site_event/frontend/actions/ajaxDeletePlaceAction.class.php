<?php

class site_event_ajaxDeletePlaceAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {    
             if (!$this->getUser()->isEventUser())             
                $this->forwardTo401Action();
          $user=new mfValidatorInteger();
          $user_id=$user->isValid($request->getPostParameter('SiteEventPlace'),$this->getUser()->getGuardUser());
          $user= new SiteEventPlace($user_id);
          if ($user->isLoaded())
          {    
            $user->delete();                    
            $response = array("action"=>"DeletePlace","id" =>$user->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

