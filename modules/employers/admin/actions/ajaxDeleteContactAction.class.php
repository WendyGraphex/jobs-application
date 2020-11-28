<?php


class employers_ajaxDeleteContactAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployerContact($validator->isValid($request->getPostParameter('EmployerContact')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Contact is invalid.'));
            $contact->delete();
            $response = array("action"=>"DeleteContact","id" =>$id,"info"=>__("Contact has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
