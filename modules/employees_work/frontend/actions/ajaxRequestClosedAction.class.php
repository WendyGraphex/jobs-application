<?php


class employees_work_ajaxRequestClosedAction extends mfAction {
    
        function execute(mfWebRequest $request) {   
             if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
                    $this->forwardTo401Action();
            $messages = mfMessages::getInstance();            
            try 
            {                       
              $item = new EmployeeWorkPaymentRequest(array('reference'=>$request->getPostParameter('EmployeeWorkPaymentRequest')),$this->getUser()->getGuardUser());
              if ($item->isNotLoaded())
                    throw new mfException(__('Request is invalid.'));
             
              $item->getWork()->getEngine()->close();
             
              //  $this->item->getStatus()->closed();  
           //   $item->getProject()->getStatus()->close();
              /*  $response=array('action'=>'RequestClosed',    
                                'status'=>__("Closed at %s",$item->getFormatter()->getRefusedAt()->getText()),
                                'reference'=>$item->get('reference'));   */            
                $messages->addInfo(__('Project has been closed.'));
            } 
            catch (mfException $e) {
                $messages->addError($e);
            }          
           $this->forward('projects', 'ajaxListPartialProjectForEmployer');
    }
}