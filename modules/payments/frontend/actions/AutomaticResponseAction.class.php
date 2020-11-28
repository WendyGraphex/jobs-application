<?php



class payments_AutomaticResponseAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {        
        $messages = mfMessages::getInstance(); 
      //     var_dump($request->getPostParameters(),$request->getRequestParameter('payment'));
        // check if payment method exists
        $request->addRequestParameter('method', 'mercanet');
        $this->forward("payments_".$request->getRequestParameter('payment'),"AutomaticResponse");  
           
    }
   
}

