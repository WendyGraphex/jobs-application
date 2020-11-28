<?php

class users_ajaxDeletesUserAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();
      try 
      {           
          $usersValidator=new mfValidatorSchemaForEach(new mfValidatorInteger(),count($request->getPostParameter('selection')));
          $usersValidator->isValid($request->getPostParameter('selection'));
          $users= new UserCollection($request->getPostParameter('selection'),'admin');
          $users->delete();          
          $this->getEventDispather()->notify(new mfEvent($users, 'users.change','delete')); 
          $response = array("action"=>"DeletesUser",
                            "info"=>__("Users have been deleted."),
                            "parameters" =>$request->getPostParameter('selection'));
      }      
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

