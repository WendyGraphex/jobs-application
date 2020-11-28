<?php


class employees_work_ajaxDeleteRequestAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
            $item= new EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'));
            if ($item->isNotLoaded()) 
                throw new mfException(__('Request is invalid.'));
          
            $item->delete();
          
            $response=array('action'=>'DeleteRequest',           
                            'info'=>__("Request have been deleted"),    
                            'status'=>(string)$item->getStatus()->getI18n(),
                            'id'=>$item->get('id'));               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;        
    }

}
