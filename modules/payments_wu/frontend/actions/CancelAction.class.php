<?php


//require_once __DIR__."/../locales/Forms/PaymentMercanetTransactionReturnForm.class.php";

class payments_wu_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        if ($request->getRequestParameter('method')!='wu')
            $this->forward ("payments", "403");      
     
        $messages = mfMessages::getInstance(); 
       
               
      //  $request->addRequestParameter('payment',$this->form->hasTransaction()?$this->form->getTransaction()->getCustomerPayment():null);
      //  $this->forward('payments', 'Return');        
    }
   
}

