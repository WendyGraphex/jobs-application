<?php


class employers_ajaxDeleteRequestAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployerAdvertRequest($validator->isValid($request->getPostParameter('EmployerRequest')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Request is invalid.'));
            $contact->delete();
            $response = array("action"=>"DeleteRequest","id" =>$id,"info"=>__("Request has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
