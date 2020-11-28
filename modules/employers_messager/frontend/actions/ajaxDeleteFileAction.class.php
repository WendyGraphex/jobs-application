<?php


class employers_messager_ajaxDeleteFileAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
      try 
      {         
          $validator=new mfValidatorInteger();
          $item= new CustomerEmployerMessageFile($validator->isValid($request->getPostParameter('EmployerMessageFile')),$this->getUser()->getGuardUser());
          if ($item->isNotLoaded())
                 throw new mfException(__('File is invalid.'));         
          $item->delete();
          $response = array("action"=>"DeleteFile","id" =>$item->get('id'));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
