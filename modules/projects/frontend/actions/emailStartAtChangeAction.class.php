<?php


class projects_emailStartAtChangeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->project=$this->getParameter('project')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');  
           EmailVariablesModel::getVariables($this);
    }
    
 
   
}


