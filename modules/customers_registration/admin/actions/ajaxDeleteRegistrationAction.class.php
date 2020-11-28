<?php


class customers_registration_ajaxDeleteRegistrationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new CustomerRegistration(array('id'=>$validator->isValid($request->getPostParameter('CustomerRegistration'))));
          if ($contact->isNotLoaded())
              throw new mfException(__('Registration is invalid'));
            $contact->delete();
            $response = array("action"=>"DeleteRegistration","id" =>$contact->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
