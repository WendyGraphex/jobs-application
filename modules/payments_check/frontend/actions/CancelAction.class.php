<?php


require_once __DIR__."/../locales/Forms/PaymentMercanetTransactionReturnForm.class.php";

class payments_check_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        if ($request->getRequestParameter('method')!='check')
            $this->forward ("payments", "403");      
     
        $messages = mfMessages::getInstance(); 
       
               
      //  $request->addRequestParameter('payment',$this->form->hasTransaction()?$this->form->getTransaction()->getCustomerPayment():null);
        $this->forward('payments', 'Return');        
    }
   
}

