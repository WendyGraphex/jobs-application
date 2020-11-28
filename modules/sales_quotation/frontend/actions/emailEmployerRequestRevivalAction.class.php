<?php

 
class sales_quotation_emailEmployerRequestRevivalAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {                      
        $this->company=$this->getParameter('company')->toArray();
        $this->quotation_request=$this->getParameter('quotation_request')->getFormatter()->toArrayForEmail();
        EmailVariablesModel::getVariables($this);
    } 
        
}
