<?php

require_once __DIR__."/../locales/Forms/CustomerRegistrationSendMessageForm.class.php";

class customers_registration_registerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
     // $this->form=new  SendMessageForm();            
      $this->form=new CustomerRegistrationSendMessageForm();    
      $this->country=strtoupper($request->getPreferredCountry());    
    }
}

