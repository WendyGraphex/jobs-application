<?php


class employees_ajaxDeleteAdvertDocumentProfileAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
            $employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user');    
            if (!$employee_user)
                 $this->forwardTo401Action();         
            $item = new EmployeeAdvertDocument($request->getPostParameter('EmployeeAdvertDocument'),$employee_user);
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteAdvertDocumentProfile',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


