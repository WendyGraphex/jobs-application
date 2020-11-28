<?php

require_once dirname(__FILE__)."/../locales/Forms/PaymentCreditEventUserMethodAddForm.class.php";

class payments_event_user_ajaxAddCreditMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->form=new PaymentCreditEventUserMethodAddForm($request->getPostParameter('AddPaymentCreditMethod'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('AddPaymentCreditMethod'))
            return ;
        $this->form->bind($request->getPostParameter('AddPaymentCreditMethod'));
        if ($this->form->isValid())
        {
            PaymentCreditEventUserMethod::updateMethods($this->form->getMethods());
            $messages->addInfo(__('Methods have been updated.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialCreditMethod');
        }  
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
}    