<?php


class employees_work_ajaxRequestAcceptedAction extends mfAction {
    
        function execute(mfWebRequest $request) {   
             if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
                    $this->forwardTo401Action();
            $messages = mfMessages::getInstance();            
            try 
            {                       
              $item = new EmployeeWorkPaymentRequest(array('reference'=>$request->getPostParameter('EmployeeWorkPaymentRequest')),$this->getUser()->getGuardUser());
                if ($item->isNotLoaded())
                    throw new mfException(__('Request is invalid.'));
               $item->getStatus()->accepted();  
                            
              $engine =  new EmployeeWorkPaymentRequestEmailEngine($item);
              $engine->sendAccepted(); 
                                 
              $this->getEventDispather()->notify(new mfEvent($item,'employee.work.request.accepted'));  
                                        
              $response=array('action'=>'RequestAccepted',    
                                'status'=>__("Accepted at %s",$item->getFormatter()->getRefusedAt()->getText()),
                                'reference'=>$item->get('reference'));               
            } 
            catch (mfException $e) {
                $messages->addError($e);
            }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}