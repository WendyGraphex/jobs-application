<?php


class employees_work_ajaxRemoveRequestAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                    
        try 
        {                       
            $item= new EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'));
            if ($item->isNotLoaded()) 
                throw new mfException(__('Request is invalid.'));
          
            $item->remove();
          
            $response=array('action'=>'RemoveRequest',           
                            'info'=>__("Request have been remove"),      
                            'id'=>$item->get('id')
                           );               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;        
    }

}
