<?php


class employees_work_ajaxRequestActiveAction extends mfAction {
    
        function execute(mfWebRequest $request) {             
            $messages = mfMessages::getInstance();            
            try 
            {                       
              $item = new EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'));
                if ($item->isNotLoaded())
                    throw new mfException(__('Request is invalid.'));
                $item->getStatus()->active();

                $response=array('action'=>'RequestActive',                                  
                                'status'=>(string)$item->getStatus(),
                                'info'=>__('Request status has been changed'),
                                'id'=>$item->get('id'));               
            } 
            catch (mfException $e) {
                $messages->addError($e);
            }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}