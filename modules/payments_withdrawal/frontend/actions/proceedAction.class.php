<?php

 
class payments_withdrawal_proceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser() || !$request->getRequestParameter('order'))             
            $this->forwardTo401Action ();
         if ($request->getRequestParameter('method')->get('name') !='withdrawal')
            $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance(); 
        
        $this->order= $request->getRequestParameter('order');
        
        $payment= new PaymentEmployerUser($this->order,$this->getUser()->getGuardUser());
        $payment->setMethod($request->getRequestParameter('method'));
        $payment->setState(PaymentEmployerUser::STATE_TOVALID);
        $payment->create();
    }
   
}

