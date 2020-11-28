<?php


class site_event_order_emailUserCancelledAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->order=$this->getParameter('order')->getFormatter()->toArrayForEmail();
           
          // var_dump($this->order);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');     
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


