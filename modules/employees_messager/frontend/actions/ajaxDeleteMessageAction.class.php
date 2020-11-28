<?php


class employees_messager_ajaxDeleteMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
      try 
      {         
          $validator=new mfValidatorInteger();
          $item= new CustomerEmployeeMessage($validator->isValid($request->getPostParameter('EmployeeMessage')),$this->getUser()->getGuardUser());
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
