<?php

 
class payments_withdrawal_proceedEventDebitAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isEventUser() || !$request->getRequestParameter('order'))             
            $this->forwardTo401Action ();
         if ($request->getRequestParameter('method')->get('name') !='withdrawal')
            $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance(); 
        
        $this->order= $request->getRequestParameter('order');
        
        $payment= new PaymentDebitEventUser($this->order,$this->getUser()->getGuardUser());
        $payment->setMethod($request->getRequestParameter('method'));
        $payment->setState(PaymentDebitEventUser::STATE_TOVALID);
        $payment->create(); 
    }
   
}

