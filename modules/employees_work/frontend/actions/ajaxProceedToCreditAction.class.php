<?php

require_once __DIR__."/../locales/Forms/ProceedToCreditPaymentRequestSelectionForm.class.php";

class employees_work_ajaxProceedToCreditAction extends mfAction {
    
        function execute(mfWebRequest $request) {    
            if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
                    $this->forwardTo401Action();
           // $this->getUser()->getStorage()->remove('payment');
            $messages = mfMessages::getInstance();   
            $form = new ProceedToCreditPaymentRequestSelectionForm($request->getPostParameter('EmployeePaymentCredit'));
            $form->bind($request->getPostParameter('EmployeePaymentCredit'));
            if ($form->isValid())
            {
                if ($payment=$this->getUser()->getStorage()->read('payment'))
                {
                    // delete or add payment                   
                    $payment->updating($form->getSelection());
                }   
                else
                {    
                    $payment = new PaymentEmployee($form->getSelection(),$this->getUser()->getGuardUSer());
                    $payment->create();
                    $this->getUser()->getStorage()->write('payment',$payment);
                }                
              //   $this->forward($this->getModuleName(), 'ajaxListPartialRequestForEmployee');               
                $this->forward('payments_employee', 'ajaxProcessToCredit'); 
            }           
            $messages->addWarning(__('Form has some errors.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialRequestForEmployee');
                
    }
}