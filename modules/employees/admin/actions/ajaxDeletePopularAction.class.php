<?php


class employees_ajaxDeletePopularAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployeePopular($validator->isValid($request->getPostParameter('EmployeePopular')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Popular is invalid.'));
            $contact->delete();
            //$response = array("action"=>"DeletePopular","id" =>$contact->get('id'));
            $response = array("action"=>"DeletePopular","id" =>$id,"info"=>__("Popular has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
