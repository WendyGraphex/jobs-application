<?php


class employees_alert_emailCreatedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->alert=$this->getParameter('alert')->getFormatter()->toArrayForEmail();
       // var_dump($this->advert['employee']);
        $this->company=$this->getParameter('company')->toArray();                     
        $this->model_i18n= $this->getParameter('model_i18n');         
        EmailVariablesModel::getVariables($this);
       //echo "<pre>"; var_dump($this->socials);
    }
    
 
   
}


