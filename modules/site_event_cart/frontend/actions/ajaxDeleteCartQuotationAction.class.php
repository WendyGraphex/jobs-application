<?php


class site_event_cart_ajaxDeleteCartEventAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            if (!$this->getUser()->isEventUser() || !$this->getUser()->getStorage()->read('event_cart'))          
                $this->forwardTo401Action();
          $validator=new mfValidatorInteger();
          $cart_event= new SiteEventCartEvent($validator->isValid($request->getPostParameter('CartEvent')),$this->getUser()->getStorage()->read('event_cart'));
          if ($cart_event->isNotLoaded())
              throw new mfException(__('Event is invalid.'));           
           //$cart_quotation->delete();                  
                  
          $response = array("action"=>"DeleteCartEvent",
                         /*   "number_of_quotations"=>$cart_quotation->getCart()->getCartQuotations()->count(),
                            "total_sale_price_with_tax"=>$cart_quotation->getCart()->getFormatter()->getTotalSalePriceWithTax()->getAmount(),
                            "commission_with_tax"=>$cart_quotation->getCart()->getFormatter()->getCommissionWithTax()->getAmount(),
                            "global_sale_with_tax"=>$cart_quotation->getCart()->getFormatter()->getGlobalSalePriceWithTax()->getAmount(),*/
                            "id" =>$cart_event->get('id'));          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
