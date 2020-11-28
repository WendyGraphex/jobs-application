<?php


class employees_emailAdvertI18nPublishedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->advert_i18n=$this->getParameter('advert_i18n')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');    
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


