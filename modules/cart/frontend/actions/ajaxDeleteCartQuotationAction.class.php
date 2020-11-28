<?php


class cart_ajaxDeleteCartQuotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser() || !$this->getUser()->getStorage()->read('cart'))          
                $this->forwardTo401Action();
          $validator=new mfValidatorInteger();
          $cart_quotation= new CartQuotation($validator->isValid($request->getPostParameter('CartQuotation')),$this->getUser()->getStorage()->read('cart'));
          if ($cart_quotation->isNotLoaded())
              throw new mfException(__('Quotation is invalid.'));           
           //$cart_quotation->delete();                  
                  
          $response = array("action"=>"DeleteCartQuotation",
                            "number_of_quotations"=>$cart_quotation->getCart()->getCartQuotations()->count(),
                            "total_sale_price_with_tax"=>$cart_quotation->getCart()->getFormatter()->getTotalSalePriceWithTax()->getAmount(),
                            "commission_with_tax"=>$cart_quotation->getCart()->getFormatter()->getCommissionWithTax()->getAmount(),
                            "global_sale_with_tax"=>$cart_quotation->getCart()->getFormatter()->getGlobalSalePriceWithTax()->getAmount(),
                            "id" =>$cart_quotation->get('id'));          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
