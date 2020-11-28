<?php


class employers_ajaxDeleteAdvertAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployerAdvert($validator->isValid($request->getPostParameter('EmployerAdvert')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Advert is invalid.'));
            $contact->delete();
           $response = array("action"=>"DeleteAdvert","id" =>$id,"info"=>__("Advert has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
