<?php

class employees_work_emailActiveRequestActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
       $this->_request=$request; 
       $this->company=$this->getParameter('company')->toArray();    
       $this->model_i18n=$this->getParameter('model_i18n');
       $this->payment_request=$this->getParameter('payment_request')->getFormatter()->toArrayForEmail();          
    } 
    
   
}

