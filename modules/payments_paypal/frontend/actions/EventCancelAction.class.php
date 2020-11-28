<?php

//http://www.project55.net/payments/paypal/cancel?paymentId=PAYID-L4GP7IA4KK8797334457133K&token=EC-4WG77093148139822&PayerID=SSZDVUZNYP32G

// http://www.project55.net/payments/paypal/cancel?token=EC-4XD6254770570010G
    
require_once __DIR__."/../locales/Forms/PaymentPaypalEventTransactionReturnForm.class.php";

class payments_paypal_EventCancelAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {                   
         if ($request->getRequestParameter('method')!='paypal')
            $this->forward ("payments", "403");      
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        
       // var_dump($request->getPostParameters());
        // check if payment method exists
        $this->form=new PaymentPaypalEventTransactionReturnForm($this->getUser()->getGuardUser());
        $this->form->bind($request->getGetParameters());
        if ($this->form->isValid())
        {        
           // echo "=1=";
           /* $this->form->getPaymentEmployerUser()->accepted();           
            $this->form->getPaymentEmployerUser()->getOrder()->paid();    */   
            if ($this->form->getPaymentEventUser()->getState()->isInProgress())
            {
                $this->form->getPaymentEventUser()->cancel();
                $this->form->getPaymentEventUser()->getOrder()->inprogress();         
            }
        }
        else
        {
          //  echo "=2=";
      //     $this->form->getPaymentEmployerUser()->refused(); 
      //     $this->form->getPaymentEmployerUser()->getOrder()->inprogress();
        }                         
         $request->addRequestParameter('payment_employer_user',$this->form->getPaymentEmployerUser());
         $this->forward('payments', 'Return');              
    }
   
}

