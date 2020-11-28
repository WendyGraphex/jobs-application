<?php

class payments_check_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)        
    {             
        if ($request->getRequestParameter('method')!='check')
            $this->forward ("payments", "403");          
        $messages = mfMessages::getInstance(); 
       
        $request->addRequestParameter('payment',true);
        $this->forward('payments', 'Return');        
    }
   
}

