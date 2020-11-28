<?php

class users_ajaxChangeSpeakerUserAction extends mfAction {
    
    
     
    function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();   
      try 
      {         
          $user=new mfValidatorInteger();
          $value=new mfValidatorBoolean();
          $user_id=$user->isValid($request->getPostParameter('id'));
          $value=$value->isValid($request->getPostParameter('value'))?"NO":"YES";
          $user= new SiteEventSpeakerUser($user_id);         
          if ($user->isLoaded()) 
          {    
              $user->set('is_active',$value);
              $user->save();
              $response = array("action"=>"ChangeUser","id"=>$user_id,"state" =>$value);
          }    
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

