<?php


class sales_billing_ajaxDeleteStateI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SaleBillingStateI18n'));          
          $item= new SaleBillingStateI18n($id);           
          $item->delete();              
          $response = array("action"=>"DeleteStateI18n","id" =>$id,"info"=>__(" State has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

