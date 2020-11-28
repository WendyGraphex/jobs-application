<?php


class sales_order_emailEmployerCancelledAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->order=$this->getParameter('order')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');     
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


