<?php

require_once dirname(__FILE__)."/../locales/Forms/PaymentDebitEventUserMethodAddForm.class.php";

class payments_event_user_ajaxAddDebitMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->form=new PaymentDebitEventUserMethodAddForm($request->getPostParameter('AddPaymentDebitMethod'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('AddPaymentDebitMethod'))
            return ;
        $this->form->bind($request->getPostParameter('AddPaymentDebitMethod'));
        if ($this->form->isValid())
        {
            PaymentDebitEventUserMethod::updateMethods($this->form->getMethods());
            $messages->addInfo(__('Methods have been updated.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialDebitMethod');
        }  
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
}    