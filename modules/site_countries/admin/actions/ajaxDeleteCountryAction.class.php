<?php


class site_countries_ajaxDeleteCountryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $language= new SiteCountry($validator->isValid($request->getPostParameter('SiteCountry')));
          if ($language->isLoaded())
          {                
            $language->delete();
            $response = array("action"=>"DeleteCountry","id" =>$language->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
