<?php

class payments_zelle_SuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)        
    {             
        if ($request->getRequestParameter('method')!='zelle')
            $this->forward ("payments", "403");          
        $messages = mfMessages::getInstance(); 
       
        $request->addRequestParameter('payment',true);
        $this->forward('payments', 'Return');        
    }
   
}

