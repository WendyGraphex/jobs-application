<?php

class payments_employer_emailEmployeeQuotationPaidActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
         $this->_request=$request;
         $this->employee=$this->getParameter('employee')->getFormatter()->toArrayForEmail();
         $this->company=$this->getParameter('company')->toArray();
         $this->model_i18n=$this->getParameter('model_i18n');
         $this->quotations=$this->getParameter('employee')->getQuotations()->toArrayForEmail();
    } 
    
   
}


