<?php


class site_languages_ajaxDeleteLanguageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $language= new Language($validator->isValid($request->getPostParameter('SiteLanguage')),'frontend');
          if ($language->isLoaded())
          {                
            $language->delete();
            $response = array("action"=>"DeleteLanguage","id" =>$language->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
