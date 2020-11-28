<?php

require_once __DIR__."/../locales/Forms/DialogAmountRequestForEmployerForm.class.php";       
 
class employees_work_ajaxSaveDialogAmountRequestForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {          
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();            
        $payment_request = new  EmployeeWorkPaymentRequest($request->getPostParameter('EmployeeWorkPaymentRequest'),$this->getUser()->getGuardUser());
        if ($payment_request->isNotLoaded())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();            
        try 
        {                  
            $form = new DialogAmountRequestForEmployerForm($payment_request);
            $form->bind($request->getPostParameter('EmployeeWorkPaymentRequestAmount'));
            if (!$form->isValid())
            {
                 $this->getController()->setRenderMode(mfView::RENDER_JSON);
                return array('action'=>'SaveDialogAmountRequestForEmployer',
                             'errors'=>$form->getErrorSchema()->getErrorsMessage()
                            );
            }   
           
            $payment_request->setTotalPriceWithTax($form->getAmount())->save();
            $payment_request->process();
            
            $engine =  new EmployeeWorkPaymentRequestEmailEngine($payment_request);
            $engine->sendAmountChange();
            
            
            $messages->addInfo(__("Amount has been modified"));
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        $request->addRequestParameter('project',  $payment_request->getProject());
        $this->forward($this->getModuleName(), 'ajaxListPartialRequestForEmployer');
        
    }
    
   
}



