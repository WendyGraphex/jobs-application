<?php

// http://www.project55.net/paypal/test
 
class payments_paypal_proceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {       
       //  $request->addRequestParameter('order',new SaleOrder(21,$this->getUser()->getGuardUser()));
         
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser() || !($order=$request->getRequestParameter('order')))            
            $this->forwardTo401Action ();
        if ($request->getRequestParameter('method')->get('name')!='paypal')
             $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance();        
        
        
        $apiContext = new PayPalRestApiContext();
        
        $employer_payment = new PaymentEmployerUser($order,$this->getUser()->getGuardUser());
        $employer_payment->setMethod($request->getRequestParameter('method'));
        $employer_payment->setPayer($apiContext->getSettings()->getPayerID());        
        $employer_payment->create();                   
      
        try {
             
        $payer = new \PayPal\Api\Payer();
        $payer->setPaymentMethod('paypal');

        $amount = new \PayPal\Api\Amount();
        $amount->setTotal($employer_payment->getTotalPriceWithTax());
        $amount->setCurrency((string)$employer_payment->getCurrency());

        $transaction = new \PayPal\Api\Transaction();
        $transaction->setAmount($amount);

        $redirectUrls = new \PayPal\Api\RedirectUrls();
        $redirectUrls->setReturnUrl($apiContext->getSuccessUrl())
                      ->setCancelUrl($apiContext->getCancelUrl());

        $this->payment = new \PayPal\Api\Payment();
        $this->payment->setIntent('sale')
            ->setPayer($payer)
            ->setTransactions(array($transaction))
            ->setRedirectUrls($redirectUrls);
                      
       
            
           /* $presentation = new \PayPal\Api\Presentation();
            $presentation->setBrandName("YeowZa! Paypal")
            ->setLocaleCode("US");
    
            $webProfile = new \PayPal\Api\WebProfile();
            $webProfile->setName("YeowZa! Jobs expert" . uniqid())
                ->setPresentation($presentation);
            
            $webProfile->create($apiContext);*/
                        
            
             $this->payment->create($apiContext);
             $employer_payment->setReference($this->payment->getToken());
             $employer_payment->save();
            
              $webhook=  new \PayPal\Api\Webhook();
             $webhook->setEventTypes(array(
                    new \PayPal\Api\WebhookEventType('{ "name":"PAYMENT.SALE.COMPLETED" }'),
                    new \PayPal\Api\WebhookEventType('{ "name":"PAYMENT.SALE.DENIED" }')));
             $webhook->setUrl($apiContext->getReturnUrl()."?key=".$employer_payment->get('reference'));
             $webhook->create($apiContext); 
                                                    
             
            $this->getController()->setRenderMode(mfView::RENDER_JSON);
            return array('redirect'=>$this->payment->getApprovalLink());
        }
        catch (\PayPal\Exception\PayPalConnectionException $ex) {
            // This will print the detailed information on the exception.
            //REALLY HELPFUL FOR DEBUGGING
            
          //  var_dump($ex->getMessage());
            trigger_error(var_export($ex->getData(),true)."\n".var_export($ex->getMessage(),true));
            
            $employer_payment->setError();
            $this->getUser()->getStorage()->write('cart',$employer_payment->getOrder()->getCart());
        }  
      
    }
   
}

