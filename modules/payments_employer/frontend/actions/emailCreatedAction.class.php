<?php


class payments_employer_emailCreatedAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->payment=$this->getParameter('payment')->getFormatter()->toArrayForEmail();
          // var_dump($this->advert['employee']);
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


