<?php

require_once __DIR__."/../locales/Forms/CustomerRegistrationSendMessageForm.class.php";

class customers_registration_registerActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');   
      $this->form =  new CustomerRegistrationSendMessageForm();    
    } 
    
    
}
