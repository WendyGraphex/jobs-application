<?php


class employees_contact_emailRegistrationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->employee_contact=$this->getParameter('employee_contact')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');   
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


