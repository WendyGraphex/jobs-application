<?php


class employees_ajaxSaveEmployeeFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           if (!$this->getUser()->isEmployee()) 
                 $this->forwardTo401Action();  
             
            $employee_user=new Employee($request->getPostParameter('EmployeeUser'));
            if ($employee_user->isNotLoaded())
                throw new mfException(__('Employee is invalid.'));
            $item = new EmployeeFavourite($employee_user,$this->getUser()->getGuardUser());
            $item->save(); 
            $response=array('action'=>'SaveEmployeeFavourite',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


