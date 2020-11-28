<?php


class employees_ajaxDeleteClaimAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployeeAdvertClaim($validator->isValid($request->getPostParameter('EmployeeAdvertClaim')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Claim is invalid.'));
            $contact->delete();
            //$response = array("action"=>"DeleteClaim","id" =>$contact->get('id'));
            $response = array("action"=>"DeleteClaim","id" =>$id,"info"=>__("Claim has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
