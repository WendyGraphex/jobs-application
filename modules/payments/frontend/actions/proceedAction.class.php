<?php

 
class payments_proceedAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        try
        {                       
             $method=new PaymentMethod($request->getRequestParameter('method'));
             if ($method->isNotLoaded())
                  throw new mfException(__('Payment is invalid.'));
             $order=new SaleOrder($request->getPostParameter('SaleOrder'),$this->getUser()->getGuardUser());
             if ($order->isNotLoaded())
                  throw new mfException(__('Order is invalid.'));
                           
             $order->setMethod($method);
             $order->set('state', SaleOrderState::ORDERED);
             $order->save();
             $request->addRequestParameter('order', $order); 
             $request->addRequestParameter('method', $method); 
              
             $this->forward($method->getModule(),"proceed");  
        }
        catch (mfException $e)
        {
            $messages->addError($e);          
        }        
        
    }
   
}

