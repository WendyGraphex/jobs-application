<?php


class employers_alert_ajaxSaveEmployeeAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           if (!$this->getUser()->isEmployerUser()) 
                 $this->forwardTo401Action();  
             
            $employee_user=new Employee($request->getPostParameter('EmployeeUser'));
            if ($employee_user->isNotLoaded())
                throw new mfException(__('Employee is invalid.'));
            $item = new EmployerAlert($employee_user,$this->getUser()->getGuardUser());
            $item->save(); 
            $response=array('action'=>'SaveEmployeeAlert',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


