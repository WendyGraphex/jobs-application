<?php

class users_ajaxDeleteUserPermissionsAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) { 
      $messages = mfMessages::getInstance();
      try 
      {        
         $user=new User($request->getPostParameter('User'),'admin');
         $userPermissionsValidator = new mfValidatorSchemaForEach(new mfValidatorChoice(array("choices" => UserPermissionUtils::getPermissionsUserbyUserList($user))), count($request->getPostParameter('selection')));
         $userPermissionsValidator->isValid($request->getPostParameter('selection'));        
         $userPermissions= new userPermissionCollection($request->getPostParameter('selection'));
         $userPermissions->delete();          
         $response = array("action"=>"deleteUserPermissions","parameters" =>$request->getPostParameter('selection'));
      } 
      catch (mfValidatorErrorSchema $e)
      {
          $messages->addErrors(array_merge($e->getGlobalErrors(),$e->getErrors()));
      }
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

