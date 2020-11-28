<?php

require_once __DIR__."/../locales/Forms/EmployerContactSendMessageForm.class.php";

class employers_contact_contactActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');     
      $this->form =  new EmployerContactSendMessageForm();    
    } 
    
    
}
