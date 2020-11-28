<?php



class payments_403Action extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance(); 
         if (!$request->addRequestParameter('method'))
             $this->forward404();
           
    }
   
}

