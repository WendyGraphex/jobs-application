<?php

 
class payments_check_creditproceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {      
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee() || !$this->payment=$request->getRequestParameter('payment'))             
            $this->forwardTo401Action ();
         if ($request->getRequestParameter('method')->get('name') !='check')
            $this->forward ("payments", "403");     
        $messages = mfMessages::getInstance(); 
          //   WAITING PAYMENT VALIDATION      
         $this->payment->setState(PaymentEmployeeState::TODO);    
         $this->payment->save();
         
         $this->getUser()->getStorage()->remove('payment');
    }
   
}

