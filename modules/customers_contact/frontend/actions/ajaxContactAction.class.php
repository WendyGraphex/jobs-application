<?php

require_once __DIR__."/../locales/Forms/SendMessageForm.class.php";

class customers_contact_ajaxContactAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      $this->form=new  SendMessageForm();              
    }
}

