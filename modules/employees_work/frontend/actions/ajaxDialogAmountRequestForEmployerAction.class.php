<?php

require_once __DIR__."/../locales/Forms/DialogAmountRequestForEmployerForm.class.php";       
 
 
class employees_work_ajaxDialogAmountRequestForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {          
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                  
        $this->payment_request = new  EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'),$this->getUser()->getGuardUser());
        if ($this->payment_request->isNotLoaded())
            $this->forwardTo401Action();
        $this->form = new DialogAmountRequestForEmployerForm($this->payment_request);
    }
    
   
}


