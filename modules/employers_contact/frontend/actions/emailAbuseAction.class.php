<?php


class employers_contact_emailAbuseAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->abuse=$this->getParameter('abuse')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                
    }
    
 
   
}


