<?php


class customers_registration_emailRegistrationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->customer=$this->getParameter('customer')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                
    }
    
 
   
}


