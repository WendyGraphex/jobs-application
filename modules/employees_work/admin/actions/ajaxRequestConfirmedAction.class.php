<?php


class employees_work_ajaxRequestConfirmedAction extends mfAction {
    
        function execute(mfWebRequest $request) {             
            $messages = mfMessages::getInstance();            
            try 
            {                       
              $item = new EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'));
                if ($item->isNotLoaded())
                    throw new mfException(__('Request is invalid.'));
                $item->getStatus()->confirmed();

                $engine =  new EmployeeWorkPaymentRequestEmailEngine($item);
                $engine->sendConfirmed();
                
                $engine =  new EmployeeWorkPaymentRequestEmailEngine($item);
                $engine->sendConfirmedEmployer();
                
                $response=array('action'=>'RequestConfirmed',    
                                'confirmed'=>__("Confirmed at %s",$item->getFormatter()->getConfirmedAt()->getText()),
                                'info'=>__('Request status has been changed'),
                                'status'=>(string)$item->getStatus(),
                                'status_actions'=>$item->isRefused()?__("Refused at %s",$item->getFormatter()->getRefusedAt()->getText()):"",
                                'id'=>$item->get('id'));               
            } 
            catch (mfException $e) {
                $messages->addError($e);
            }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}