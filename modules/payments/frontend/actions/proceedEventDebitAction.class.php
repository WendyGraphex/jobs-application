<?php

 
class payments_proceedEventDebitAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isEventUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        try
        {                       
             $method=new PaymentMethod($request->getRequestParameter('method'));
             if ($method->isNotLoaded())
                  throw new mfException(__('Payment is invalid.'));
             $order=new SiteEventOrder($request->getPostParameter('SiteEventOrder'),$this->getUser()->getGuardUser());
             if ($order->isNotLoaded())
                  throw new mfException(__('Order is invalid.'));
                           
             $order->setMethod($method);
             $order->set('state', SiteEventOrderState::ORDERED);
             $order->save();
             $request->addRequestParameter('order', $order); 
             $request->addRequestParameter('method', $method); 
              
             $this->forward($method->getModule(),"proceedEventDebit");  
        }
        catch (mfException $e)
        {
            $messages->addError($e);          
        }        
        
    }
   
}

