<?php

// http://www.project55.net/paypal/test
 
class payments_paypal_proceedEventDebitAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {       
       //  $request->addRequestParameter('order',new SaleOrder(21,$this->getUser()->getGuardUser()));
         
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser() || !($order=$request->getRequestParameter('order')))            
            $this->forwardTo401Action ();
        if ($request->getRequestParameter('method')->get('name')!='paypal')
             $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance();        
        
        
        $apiContext = new PayPalRestApiContext();
        
        $event_payment = new PaymentDebitEventUser($order,$this->getUser()->getGuardUser());
        $event_payment->setMethod($request->getRequestParameter('method'));
        $event_payment->setPayer($apiContext->getSettings()->getPayerID());        
        $event_payment->create();                   
      
        try {
             
        $payer = new \PayPal\Api\Payer();
        $payer->setPaymentMethod('paypal');

        $amount = new \PayPal\Api\Amount();
        $amount->setTotal($event_payment->getTotalPriceWithTax());
        $amount->setCurrency((string)$event_payment->getCurrency());

        $transaction = new \PayPal\Api\Transaction();
        $transaction->setAmount($amount);

        $redirectUrls = new \PayPal\Api\RedirectUrls();
        $redirectUrls->setReturnUrl($apiContext->getEventSuccessUrl())
                      ->setCancelUrl($apiContext->getEventCancelUrl());

        $this->payment = new \PayPal\Api\Payment();
        $this->payment->setIntent('sale')
            ->setPayer($payer)
            ->setTransactions(array($transaction))
            ->setRedirectUrls($redirectUrls);
                 
            
             $this->payment->create($apiContext);
             $event_payment->setReference($this->payment->getToken());
             $event_payment->save();
            
              $webhook=  new \PayPal\Api\Webhook();
             $webhook->setEventTypes(array(
                    new \PayPal\Api\WebhookEventType('{ "name":"PAYMENT.SALE.COMPLETED" }'),
                    new \PayPal\Api\WebhookEventType('{ "name":"PAYMENT.SALE.DENIED" }')));
             $webhook->setUrl($apiContext->getEventReturnUrl()."?key=".$event_payment->get('reference'));
             $webhook->create($apiContext); 
                                                    
             
            $this->getController()->setRenderMode(mfView::RENDER_JSON);
            return array('redirect'=>$this->payment->getApprovalLink());
        }
        catch (\PayPal\Exception\PayPalConnectionException $ex) {
            // This will print the detailed information on the exception.
            //REALLY HELPFUL FOR DEBUGGING
            
          //  var_dump($ex->getMessage());
            trigger_error(var_export($ex->getData(),true)."\n".var_export($ex->getMessage(),true));
            
            $event_payment->setError();
            $this->getUser()->getStorage()->write('cart',$event_payment->getOrder()->getCart());
        }  
      
    }
   
}

