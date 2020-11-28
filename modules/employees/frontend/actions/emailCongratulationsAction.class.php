<?php


class employees_emailCongratulationsAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->employee=$this->getParameter('employee')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');  
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


