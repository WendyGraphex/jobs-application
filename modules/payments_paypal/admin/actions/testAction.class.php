<?php

 //http://www.project55.net/admin/payments/paypal/admin/test




class payments_paypal_testAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                            
     /*   $apiContext = new PayPalRestApiContext(
                new \PayPal\Auth\OAuthTokenCredential(
                  //  'AYSq3RDGsmBLJE-otTkBtM-jBRd1TCQwFf9RGfwddNXWz0uFU9ztymylOhRS',     // ClientID
                  //  'EGnHDxD_qRPdaLdZz8iCr8N7_MzF-YHPTkjs6NKYQvQSBngp4PTTVWkPZRbL'      // ClientSecret
                        "AQeSDKfIJjpQhwIGYxOcQJU2qcG0n_IKuO0O0eNX_udQFZ76wr1SgXqNKzTk4ANogls_GeCLCING96qi",
                        "EM0nkefMEKRpHfwBUG5M5uv6MywUtlak4HaE8_sbNS6OXkcSQIfmauj9Aj7geWnuP0JJcsmGIp8CSDry"
                )
        );*/
        
         $apiContext = new PayPalRestApiContext();
               
        $payer = new \PayPal\Api\Payer();
        $payer->setPaymentMethod('paypal');

        $amount = new \PayPal\Api\Amount();
        $amount->setTotal('11.00');
        $amount->setCurrency('USD');

        $transaction = new \PayPal\Api\Transaction();
        $transaction->setAmount($amount);

        $redirectUrls = new \PayPal\Api\RedirectUrls();
        $redirectUrls->setReturnUrl("https://example.com/your_redirect_url.html")
            ->setCancelUrl("https://example.com/your_cancel_url.html");

        $payment = new \PayPal\Api\Payment();
        $payment->setIntent('sale')
            ->setPayer($payer)
            ->setTransactions(array($transaction))
            ->setRedirectUrls($redirectUrls);

        try {
            $payment->create($apiContext);
            echo $payment;

            echo "\n\nRedirect user to approval_url: " . $payment->getApprovalLink() . "\n";
        }
        catch (\PayPal\Exception\PayPalConnectionException $ex) {
            // This will print the detailed information on the exception.
            //REALLY HELPFUL FOR DEBUGGING
            echo $ex->getData();
        }
        die(__METHOD__);
    }
    
}    