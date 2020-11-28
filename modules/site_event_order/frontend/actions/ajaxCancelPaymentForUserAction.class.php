<?php

class site_event_order_ajaxCancelPaymentForUserAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        if (!$this->getUser()->isEventUser())          
             $this->forwardTo401Action();
        $item=new SiteEventOrder($request->getPostParameter('SiteEventOrder'));
      //  $item->cancel();
         $engine = new SiteEventOrderEmailEngine($item);
        $engine->sendCancelled();
        
        
        $response = array("action"=>"CancelPaymentForUser",
                          "state"=>$item->getStateI18n(),
                          "id"=>$item->get('id'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

