<?php

class site_currency_ajaxDeleteMultipleCurrencyAction extends mfAction {
       
    function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();
      try 
      {          
          $itemsValidator=new mfValidatorSchemaForEach(new mfValidatorInteger(),count($request->getPostParameter('selection')));
          $itemsValidator->isValid($request->getPostParameter('selection'));
          $items= new SiteCurrencyCollection($request->getPostParameter('selection'));
          $items->delete();                 
          $response = array("action"=>"DeleteMultipleCurrency","parameters" =>$request->getPostParameter('selection'));
      }       
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

