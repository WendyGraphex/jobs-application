<?php


class customers_registration_emailRecipientRegistrationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->registration=$this->getParameter('registration')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                
    }
    
 
   
}


