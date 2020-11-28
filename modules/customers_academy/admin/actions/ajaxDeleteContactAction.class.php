<?php


class customers_academy_ajaxDeleteContactAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new CustomerAcademyContact(array('id'=>$validator->isValid($request->getPostParameter('CustomerAcademyContact'))));
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
