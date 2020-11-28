<?php

class sales_order_ajaxCancelPaymentForEmployerAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        if (!$this->getUser()->isEmployerUser())          
             $this->forwardTo401Action();
        $item=new SaleOrder($request->getPostParameter('SaleOrder'));
       //  $item->cancel();
        
        $engine = new SaleOrderEmailEngine($item);
        $engine->sendCancelled();
        
        
        
        $response = array("action"=>"CancelPaymentForEmployer",
                          "state"=>$item->getStateI18n(),
                          "id"=>$item->get('id'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

