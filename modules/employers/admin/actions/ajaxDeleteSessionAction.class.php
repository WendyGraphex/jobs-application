<?php


class employers_ajaxDeleteSessionAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $session= new EmployerUserSession($validator->isValid($request->getPostParameter('EmployerSession')));
          if ($session->isNotLoaded())
                 throw new mfException(__('Search is invalid.'));
            $session->delete();
            $response = array("action"=>"DeleteSession","id" =>$id,"info"=>__("Search has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
