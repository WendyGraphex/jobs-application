<?php

require_once dirname(__FILE__)."/../locales/Forms/PaymentEmployerMethodAddForm.class.php";

class payments_employer_ajaxAddMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->form=new PaymentEmployerMethodAddForm($request->getPostParameter('AddPaymentMethod'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('AddPaymentMethod'))
            return ;
        $this->form->bind($request->getPostParameter('AddPaymentMethod'));
        if ($this->form->isValid())
        {
            PaymentEmployerMethod::updateMethods($this->form->getMethods());
            $messages->addInfo(__('Methods have been updated.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialMethod');
        }  
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
}    