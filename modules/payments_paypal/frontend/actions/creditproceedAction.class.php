<?php

 
class payments_paypal_creditproceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {      
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee() || !$this->payment=$request->getRequestParameter('payment'))             
            $this->forwardTo401Action ();
         if ($request->getRequestParameter('method')->get('name') !='paypal')
            $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance();
        $this->error=false;                                      
        try {
                $apiContext = new PayPalRestApiContext();  
                $settings=new PaymentEmployeeSettings($request->getRequestParameter('method'),$this->getUser()->getGuardUser());
                if ($settings->isNotLoaded())
                    throw new mfException(__('No paypal parameters'));
                if (!$settings->getOptions()->hasEmail())
                    throw new mfException(__('Email account is missing.'));
                 
                $payouts = new \PayPal\Api\Payout();
                $senderBatchHeader = new \PayPal\Api\PayoutSenderBatchHeader();
                $senderBatchHeader->setSenderBatchId($this->payment->get('reference').uniqid())
                                  ->setEmailSubject(__("You have a Payout!"));
                
                $senderItem = new \PayPal\Api\PayoutItem();
                $senderItem->setRecipientType('Email')
                    ->setNote(__('Thanks for your job!'))
                    ->setReceiver($settings->getOptions()->getEmail())
                    ->setSenderItemId($this->payment->get('reference'))
                    ->setAmount(new \PayPal\Api\Currency($this->payment->getFormatter()->getAmount()->toArray()));
                $payouts->setSenderBatchHeader($senderBatchHeader)
                        ->addItem($senderItem);
                $output = $payouts->create(array('sync_mode'=>false),$apiContext);
              
                $results = $payouts->get($output->getBatchHeader()->getPayoutBatchId(), $apiContext);
              
                $this->payment->set('options',$settings->get('options'));
                $this->payment->set('authorization',$output->getBatchHeader()->getPayoutBatchId());   
                $this->payment->set('transaction_time',date("Y-m-d H:i:s",strtotime($results->getBatchHeader()->getTimeCreated())));
                $this->payment->set('transaction_fee',$results->getBatchHeader()->getFees()->getValue());
                $this->payment->set('transaction_fee_currency',$results->getBatchHeader()->getFees()->getCurrency());
                $this->payment->paid();
         
                $this->getUser()->getStorage()->remove('payment');
               
        }
        catch (\PayPal\Exception\PayPalConnectionException $ex) {
            // This will print the detailed information on the exception.
            //REALLY HELPFUL FOR DEBUGGING
          //  echo $ex->getData();
             $this->error=true;
        }           
    }
   
}

