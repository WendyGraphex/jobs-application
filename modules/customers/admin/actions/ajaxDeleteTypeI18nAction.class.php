<?php


class customers_ajaxDeleteTypeI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerClaimTypeI18n'));          
          $item= new CustomerClaimTypeI18n($id);           
          $item->delete();              
          $response = array("action"=>"DeleteTypeI18n","id" =>$id,"info"=>__("Type has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

