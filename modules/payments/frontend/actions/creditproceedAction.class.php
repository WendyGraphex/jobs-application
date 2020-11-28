<?php

 
class payments_creditproceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {                  
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee() || !$this->payment=$this->getUser()->getStorage()->read('payment'))             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        try
        {               
             $method=new PaymentMethod($request->getRequestParameter('method'));
             if ($method->isNotLoaded())
                  throw new mfException(__('Payment is invalid.'));              
             $this->payment->setMethod($method);
             $this->payment->save();
             
             $request->addRequestParameter('payment', $this->payment); 
             $request->addRequestParameter('method', $method); 
              
             $this->forward($method->getModule(),"creditproceed");  
        }
        catch (mfException $e)
        {
            $messages->addError($e);          
        }        
        
    }
   
}


