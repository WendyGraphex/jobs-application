<?php


class employees_alert_ajaxDeleteEmployeeAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
             
            $employee_user=new Employee($request->getPostParameter('EmployeeUser'));
            if ($employee_user->isNotLoaded())
                throw new mfException(__('Employee is invalid.'));
            $item = new EmployeeAlert($employee_user,$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Alert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteEmployeeAlert',                             
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


