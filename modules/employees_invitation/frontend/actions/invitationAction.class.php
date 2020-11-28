<?php

require_once __DIR__."/../locales/Forms/EmployeeInvitationSendMessageForm.class.php";

class employees_invitation_invitationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
     // $this->form=new  SendMessageForm();            
       $this->form=new EmployeeInvitationSendMessageForm();    
    //  $this->country=strtoupper($request->getPreferredCountry());    
    }
}

