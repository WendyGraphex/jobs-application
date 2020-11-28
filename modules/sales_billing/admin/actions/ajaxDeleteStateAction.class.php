<?php


class sales_billing_ajaxDeleteStateAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SaleBillingState'));          
          $item= new SaleBillingState($id);           
          $item->delete();              
          $response = array("action"=>"DeleteState","id" =>$id,"info"=>__("State has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

