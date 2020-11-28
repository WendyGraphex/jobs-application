<?php

require_once dirname(__FILE__)."/../locales/Forms/PaymentEmployeeMethodAddForm.class.php";

class payments_employee_ajaxAddMethodAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->form=new PaymentEmployeeMethodAddForm($request->getPostParameter('AddPaymentMethod'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('AddPaymentMethod'))
            return ;
        $this->form->bind($request->getPostParameter('AddPaymentMethod'));
        if ($this->form->isValid())
        {
            PaymentEmployeeMethod::updateMethods($this->form->getMethods());
            $messages->addInfo(__('Methods have been updated.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialMethod');
        }  
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
}    