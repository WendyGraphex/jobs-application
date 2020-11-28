<?php

require_once __DIR__."/../locales/Forms/EmployerInvitationSendMessageForm.class.php";

class employers_invitation_invitationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();       
      $this->form=new EmployerInvitationSendMessageForm();       
    }
}

