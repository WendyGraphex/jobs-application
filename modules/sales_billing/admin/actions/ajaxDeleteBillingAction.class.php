<?php


class sales_billing_ajaxDeleteBillingAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $SaleBilling= new SaleBilling(array('id'=>$validator->isValid($request->getPostParameter('SaleBilling'))));
          if ($SaleBilling->isLoaded())
          {    
            $SaleBilling->set('status','DELETE');
            $SaleBilling->delete();
            $response = array("action"=>"DeleteBilling","id" =>$SaleBilling->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
