<?php


class employees_emailForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {       
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');         
           $this->forgotpassword =$this->getParameter('forgotpassword')->toArray();       
           $this->employee=$this->getParameter('employee')->getFormatter()->toArrayForEmail(); 
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


