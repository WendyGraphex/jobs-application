<?php


class employers_alert_ajaxSaveEmployerAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           if (!$this->getUser()->isEmployerUser()) 
                 $this->forwardTo401Action();  
             
            $employer_user=new EmployerUser($request->getPostParameter('EmployerUser'));
            if ($employer_user->isNotLoaded())
                throw new mfException(__('Employer is invalid.'));
            $item = new EmployerAlert($employer_user,$this->getUser()->getGuardUser());
            $item->save(); 
            $response=array('action'=>'SaveEmployerAlert',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


