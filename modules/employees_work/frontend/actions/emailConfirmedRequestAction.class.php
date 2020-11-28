<?php


class employees_work_emailConfirmedRequestAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->payment_request=$this->getParameter('payment_request')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n'); 
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


