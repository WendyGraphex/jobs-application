<?php


class employees_emailAdvertRevivalAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->advert=$this->getParameter('advert')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                       
    }
    
 
   
}


