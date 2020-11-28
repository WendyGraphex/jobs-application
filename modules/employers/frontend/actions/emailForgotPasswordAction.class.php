<?php


class employers_emailForgotPasswordAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
           $this->user=$this->getParameter('employer_user')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');         
           $this->forgotpassword =$this->getParameter('forgotpassword')->toArray(); 
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


