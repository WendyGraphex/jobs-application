<?php


class employers_ajaxDeleteAlertAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployerAdvertAlert($validator->isValid($request->getPostParameter('EmployerAlert')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Alert is invalid.'));
            $contact->delete();
            $response = array("action"=>"DeleteAlert","id" =>$id,"info"=>__("Alert has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
