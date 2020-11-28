<?php

class site_currency_ajaxDeleteCurrencyAction extends mfAction {
    
      
    function execute(mfWebRequest $request) { 
    
      $messages = mfMessages::getInstance();   
      try 
      {                 
          $item= new SiteCurrency($request->getPostParameter('SiteCurrency'));
          if ($item->isNotLoaded())
              throw new mfException(__('Currency is invalid.'));
          $item->delete();                 
          $response = array("action"=>"DeleteCurrency",
                            "info"=>__("Currency has been deleted."),
                            "id" =>$item->get('id'));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

