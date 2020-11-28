<?php


class customers_contact_ajaxDeleteContactAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new CustomerContact(array('id'=>$validator->isValid($request->getPostParameter('CustomerContact'))));
          if ($contact->isNotLoaded())
              throw new mfException(__('Contact is invalid'));
            $contact->delete();
            $response = array("action"=>"DeleteContact","id" =>$contact->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
