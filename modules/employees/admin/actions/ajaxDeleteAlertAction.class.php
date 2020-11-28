<?php


class employees_ajaxDeleteAlertAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployeeAlert($validator->isValid($request->getPostParameter('EmployeeAlert')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Alert is invalid.'));
            $contact->delete();
            //$response = array("action"=>"DeleteAlert","id" =>$contact->get('id'));
            $response = array("action"=>"DeleteAlert","id" =>$id,"info"=>__("Alert has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
