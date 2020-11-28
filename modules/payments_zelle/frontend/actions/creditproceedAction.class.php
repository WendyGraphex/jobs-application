<?php

 
class payments_zelle_creditproceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {           
         if (!$this->getUser()->isEmployee() || !$this->payment=$request->getRequestParameter('payment'))             
            $this->forwardTo401Action ();
         if ($request->getRequestParameter('method')->get('name') !='zelle')
            $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance();
         //   WAITING PAYMENT VALIDATION                                          
         $this->payment->setState(PaymentEmployeeState::TODO);   
         $this->payment->getRequests()->todo();
         $this->payment->save();
         $this->getUser()->getStorage()->remove('payment');
                
    }
   
}

