<?php


class employers_invitation_ajaxClearInvitationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      
      EmployerInvitation::truncate();    
      $messages->addInfo(__('Invitation Database has been cleared.'));
      $this->forward($this->getModuleName(), 'ajaxListPartialInvitation');
    }
}
