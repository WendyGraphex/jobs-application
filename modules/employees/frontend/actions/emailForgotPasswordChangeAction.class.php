<?php


class employees_emailForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
           $this->user=$this->getParameter('employee')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n'); 
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


