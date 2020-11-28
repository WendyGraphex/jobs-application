<?php


class employees_emailAdvertRefusedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->advert=$this->getParameter('advert')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');  
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


