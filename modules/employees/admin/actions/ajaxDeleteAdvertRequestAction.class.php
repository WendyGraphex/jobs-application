<?php


class employees_jaxDeleteAdvertRequestAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $request= new EmployeeAdvertRequest($validator->isValid($request->getPostParameter('EmployeeAdvertRequest')));
          if ($request->isNotLoaded())
                 throw new mfException(__('Request is invalid.'));
            $request->delete();
            $response = array("action"=>"DeleteAdvertRequest","id" =>$id,"info"=>__("Request has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
