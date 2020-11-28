<?php

class sales_quotation_emailEmployerRequestAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->quotation_request=$this->getParameter('quotation_request')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n'); 
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


