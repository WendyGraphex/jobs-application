<?php

//http://www.project55.net/payments/paypal/cancel?paymentId=PAYID-L4GP7IA4KK8797334457133K&token=EC-4WG77093148139822&PayerID=SSZDVUZNYP32G

// http://www.project55.net/payments/paypal/cancel?token=EC-4XD6254770570010G
    
require_once __DIR__."/../locales/Forms/PaymentPaypalTransactionReturnForm.class.php";

class payments_paypal_CancelAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {                   
         if ($request->getRequestParameter('method')!='paypal')
            $this->forward ("payments", "403");      
       if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        
       // var_dump($request->getPostParameters());
        // check if payment method exists
        $this->form=new PaymentPaypalTransactionReturnForm($this->getUser()->getGuardUser());
        $this->form->bind($request->getGetParameters());
        if ($this->form->isValid())
        {        
           // echo "=1=";
           /* $this->form->getPaymentEmployerUser()->accepted();           
            $this->form->getPaymentEmployerUser()->getOrder()->paid();    */   
            if ($this->form->getPaymentEmployerUser()->getState()->isInProgress())
            {
                $this->form->getPaymentEmployerUser()->cancel();
                $this->form->getPaymentEmployerUser()->getOrder()->inprogress();         
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

