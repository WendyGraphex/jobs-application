<?php

class payments_employee_ajaxPaidAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
        $item= new PaymentEmployee($request->getPostParameter('PaymentEmployee'));    
        if ($item->isNotLoaded())
              throw new mfException(__('Payment is invalid'));       
        
        $item->paid();
        
        $engine =new PaymentEmployeeEmailEngine($item);
        $engine->sendCreated();
        
        $response = array("action"=>"PaymentPaid",
                          "state"=>(string)$item->getState(),
                          "id"=>$item->get('id'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

