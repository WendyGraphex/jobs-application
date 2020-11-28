<?php


class employees_emailAdvertI18nRefusedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->advert=$this->getParameter('advert_i18n')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                       
    }
    
 
   
}


