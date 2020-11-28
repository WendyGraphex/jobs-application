<?php

class site_cookie_ajaxAckAction extends mfAction {

    function execute(mfWebRequest $request) {
       $messages = mfMessages::getInstance();   
      try 
      {         
           if (!$this->getUser()->getStorage()->read('cookie_ok',false))
                $this->getUser()->getStorage()->write('cookie_ok',true);
          SiteCookie::create($request->getIP());
          $response = array("status"=>"ok");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $response; 
    }
    
}    
