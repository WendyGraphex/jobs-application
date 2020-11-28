<?php

class payments_wu_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)        
    {             
        if ($request->getRequestParameter('method')!='wu')
            $this->forward ("payments", "403");          
        $messages = mfMessages::getInstance(); 
       
        $request->addRequestParameter('payment',true);
        $this->forward('payments', 'Return');        
    }
   
}

