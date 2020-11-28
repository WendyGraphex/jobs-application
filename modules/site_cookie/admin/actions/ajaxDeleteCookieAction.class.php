<?php


class site_cookie_ajaxDeleteCookieAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $cookie= new SiteCookie($validator->isValid($request->getPostParameter('Cookie')));
          if ($cookie->isNotLoaded())
              throw new mfException(__('Cookie is invalid'));      
          //  $gallery->delete();
            $response = array("action"=>"DeleteCookie","id" =>$id,"info"=>__("Cookie has been deleted."));        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
