<?php


class employees_ajaxDeletePictureContentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
      try 
      {                
            $this->getUser()->getGuardUser()->getContent()->getPicture()->delete();   
            $response = array("action"=>"DeletePictureContent"  );       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
