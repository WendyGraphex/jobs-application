<?php


class payments_ajaxDeleteMethodAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $method= new PaymentMethod(array('id'=>$validator->isValid($request->getPostParameter('PaymentMethod'))));
          if ($method->isLoaded())
          {    
            $method->set('status','DELETE');
            $method->delete();
            $response = array("action"=>"DeletePaymentMethod","id" =>$id,"info"=>__("Payment method has been deleted."));
            //$response = array("action"=>"DeletePaymentMethod","id" =>$method->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
