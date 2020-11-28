<?php

require_once __DIR__."/../locales/Forms/EmployeeContactSendMessageForm.class.php";

class employees_contact_contactActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
      $this->tpl=$this->getParameter('tpl','default');     
      $this->form =  new EmployeeContactSendMessageForm();    
    } 
    
    
}
