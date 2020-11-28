<?php

require_once __DIR__."/../locales/Forms/CustomerContactSendMessageForm.class.php";

class customers_contact_contactActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');   
      $this->form =  new CustomerContactSendMessageForm();    
    } 
    
    
}
