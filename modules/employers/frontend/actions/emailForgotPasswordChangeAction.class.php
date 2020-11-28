<?php


class employers_emailForgotPasswordChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
           $this->user=$this->getParameter('employer_user')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');  
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


