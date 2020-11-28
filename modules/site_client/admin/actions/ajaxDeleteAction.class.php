<?php


class site_client_ajaxDeleteAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $language= new SiteClient($validator->isValid($request->getPostParameter('SiteClient')),'frontend');
          if ($language->isLoaded())
          {                
            $language->delete();
            $response = array("action"=>"DeleteClient","id" =>$language->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
