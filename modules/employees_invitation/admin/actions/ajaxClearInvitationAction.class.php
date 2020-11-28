<?php


class employees_invitation_ajaxClearInvitationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      
      EmployeeInvitation::truncate();    
      $messages->addInfo(__('Invitation Database has been cleared.'));
      $this->forward($this->getModuleName(), 'ajaxListPartialInvitation');
    }
}
