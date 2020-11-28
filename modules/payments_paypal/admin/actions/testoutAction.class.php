<?php

 //http://www.project55.net/admin/payments/paypal/admin/testout




class payments_paypal_testoutAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        
        
        //time_created
        var_dump(date("Y-m-d H:i:s",strtotime("2020-07-15T00:36:47Z")));
        
        die(__METHOD__);
        $apiContext = new PayPalRestApiContext();                
        
      

        try {
                $payouts = new \PayPal\Api\Payout();
                $senderBatchHeader = new \PayPal\Api\PayoutSenderBatchHeader();
                $senderBatchHeader->setSenderBatchId(uniqid())
                    ->setEmailSubject("You have a Payout!");
                
                $senderItem = new \PayPal\Api\PayoutItem();
                $senderItem->setRecipientType('Email')
                    ->setNote('Thanks for your patronage!')
                    ->setReceiver('paypal-p.dev@ewebsolutions.fr')
                    ->setSenderItemId("2014031400023")
                    ->setAmount(new \PayPal\Api\Currency('{
                                        "value":"11.22",
                                        "currency":"USD"
                                    }'));
                $payouts->setSenderBatchHeader($senderBatchHeader)
                        ->addItem($senderItem);
                $output = $payouts->create(array('sync_mode'=>false),$apiContext);
                
                 $results = $payouts->get($output->getBatchHeader()->getPayoutBatchId(), $apiContext);
                
              echo "<pre>";  var_dump($results->getBatchHeader());
        }
        catch (\PayPal\Exception\PayPalConnectionException $ex) {
            // This will print the detailed information on the exception.
            //REALLY HELPFUL FOR DEBUGGING
            echo $ex->getData();
        }
        die(__METHOD__);
    }
    
}    