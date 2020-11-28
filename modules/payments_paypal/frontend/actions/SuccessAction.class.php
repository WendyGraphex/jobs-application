<?php

// http://www.project55.net/payments/paypal/success?paymentId=PAYID-L4FEPVA2M957621A1581622H&token=EC-1MV45663DX703480M&PayerID=SSZDVUZNYP32G
require_once __DIR__."/../locales/Forms/PaymentPaypalTransactionSuccessForm.class.php";

class payments_paypal_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {       
        if ($request->getRequestParameter('method')!='paypal')
            $this->forward ("payments", "403");      
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
       // var_dump($request->getPostParameters());
        // check if payment method exists
        try
        {
            $this->form=new PaymentPaypalTransactionSuccessForm($this->getUser()->getGuardUser());
            $this->form->bind($request->getGetParameters());
            if ($this->form->isValid())
            {                                            
                $apiContext = new PayPalRestApiContext();
                $payment = \PayPal\Api\Payment::get($this->form->getPaymentID(), $apiContext);

                $execution = new PayPal\Api\PaymentExecution();
                $execution->setPayerId($this->form->getPayerID());

                try {
                  // Execute payment
                  $result = $payment->execute($execution, $apiContext);
                  // echo "<pre>"; var_dump($result->getTransactions()[0]->getRelatedResources()[0]->getSale()->getTransactionFee());

                  $transaction_fee = $result->getTransactions()[0]->getRelatedResources()[0]->getSale()->getTransactionFee();
                } catch (PayPal\Exception\PayPalConnectionException $ex) {
                  //echo $ex->getCode();
                 // echo $ex->getData();
                    $request->addRequestParameter('error', __('Paypal error %s.',$ex->getCode()));
                   $this->forward('payments', 'Error');
                } catch (Exception $ex) {
                      $request->addRequestParameter('error', __('Paypal fatal error %s.',$ex->getMessage()));
                     $this->forward('payments', 'Error');
                }

                $this->form->getPaymentEmployerUser()->setFee($transaction_fee->getValue(),$transaction_fee->getCurrency());
                $this->form->getPaymentEmployerUser()->accepted();           
                $this->form->getPaymentEmployerUser()->getOrder()->paid();       

                $this->getEventDispather()->notify(new mfEvent($this->form->getPaymentEmployerUser(),'payment.accepted'));
            }
            else
            {
               if ($this->form->getPaymentEmployerUser() && $this->form->getPaymentEmployerUser()->isNotLoaded())
                    throw new mfException(__('Payment invalid.'))  ;
               if ($this->form->getPaymentEmployerUser())
               {    
                    $this->form->getPaymentEmployerUser()->refused(); 
                    $this->form->getPaymentEmployerUser()->getOrder()->inprogress();
               }
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e->getMessage());
        }
         $request->addRequestParameter('payment_employer_user',$this->form->getPaymentEmployerUser());
         $this->forward('payments', 'Return');        
    }
   
}

