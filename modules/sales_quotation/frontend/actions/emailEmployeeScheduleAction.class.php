<?php

class sales_quotation_emailEmployeeScheduleAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->quotation=$this->getParameter('quotation')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');    
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


