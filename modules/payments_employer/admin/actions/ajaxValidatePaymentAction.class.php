<?php

class payments_employer_ajaxValidatePaymentAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $item= new  PaymentEmployerUser($request->getPostParameter('PaymentEmployer'));
        if ($item->isNotLoaded())
            throw new mfException(__('Payment is invalid.'));
        $item->validate();

        $this->getEventDispather()->notify(new mfEvent($item,'payment.accepted'));           
        
        $response = array("action"=>"ValidatePayment",
                          "state"=>$item->getStateI18n(),
                          "info"=>__("Payment [%s] is validated.",$item->get('reference')),
                          "id"=>$item->get('id'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

