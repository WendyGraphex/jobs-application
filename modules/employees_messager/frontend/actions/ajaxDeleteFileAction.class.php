<?php


class employees_messager_ajaxDeleteFileAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();  
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
      try 
      {         
          $validator=new mfValidatorInteger();
          $item= new CustomerEmployeeMessageFile($validator->isValid($request->getPostParameter('EmployeeMessageFile')),$this->getUser()->getGuardUser());
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
