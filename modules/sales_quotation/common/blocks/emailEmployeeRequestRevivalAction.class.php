<?php

 
class sales_quotation_emailEmployeeRequestRevivalActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {              
         $this->_request=$request;
         $this->company=$this->getParameter('company')->toArray();
         $this->quotation_request=$this->getParameter('quotation_request')->getFormatter()->toArrayForEmail();
    } 
        
}
