<?php


class employers_emailUserCreationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
           $this->user=$this->getParameter('employer_user')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');  
           EmailVariablesModel::getVariables($this);
             
    }
    
 
   
}


