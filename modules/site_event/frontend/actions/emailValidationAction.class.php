<?php


class site_event_emailValidationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                       
           $this->user=$this->getParameter('user')->getFormatter()->toArrayForEmail();                            
           $this->model_i18n= $this->getParameter('model_i18n');   
           $this->token=$this->getParameter('token')->toArrayForEmail();   
           $this->company=$this->getParameter('company')->toArray();
            EmailVariablesModel::getVariables($this);
    }
    
 
   
}


