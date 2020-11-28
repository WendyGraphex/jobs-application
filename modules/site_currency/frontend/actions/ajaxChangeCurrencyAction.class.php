<?php

class site_currency_ajaxChangeCurrencyAction extends mfAction {
    
      
    function execute(mfWebRequest $request) { 
    
      $messages = mfMessages::getInstance();   
      try 
      {                 
          $item= new SiteCurrency($request->getPostParameter('Currency'));
          if ($item->isNotLoaded())
              throw new mfException(__('Currency is invalid.'));
          $this->getUser()->getStorage()->write('currency',$item);       
          $this->getEventDispather()->notify(new mfEvent($item, 'currency.change'));        
          $response = array("action"=>"ChangeCurrency",                            
                            "code" =>$item->getCode()->getValue(),  
                            "title"=>(string)$item->getCode()->getText()->ucfirst(),
                            "symbol"=>$item->getCode()->getSymbol(),
                  );
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

