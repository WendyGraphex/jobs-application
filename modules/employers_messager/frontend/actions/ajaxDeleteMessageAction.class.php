<?php


class employers_messager_ajaxDeleteMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
      try 
      {         
          $validator=new mfValidatorInteger();
          $item= new CustomerEmployerMessage($validator->isValid($request->getPostParameter('EmployerMessage')),$this->getUser()->getGuardUser());
          if ($item->isNotLoaded())
                 throw new mfException(__('Message is invalid.'));         
          $item->delete();
          $response = array("action"=>"DeleteMessage","id" =>$item->get('id'),"info"=>__("Message has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
