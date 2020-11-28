<?php


class employers_ajaxDeleteEmployeeFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
             
            $employee_user=new Employee($request->getPostParameter('EmployeeUser'));
            if ($employee_user->isNotLoaded())
                throw new mfException(__('Employee is invalid.'));
            $item = new EmployerFavourite($employee_user,$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Favourite is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteEmployeeFavourite',                             
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


