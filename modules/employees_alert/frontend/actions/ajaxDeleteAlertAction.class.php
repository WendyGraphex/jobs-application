<?php


class employees_alert_ajaxDeleteAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $item = new EmployeeAlert($request->getPostParameter('EmployeeAlert'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Alert is invalid.'));
             $item->delete();
            
            $response=array('action'=>'DeleteAlert',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


