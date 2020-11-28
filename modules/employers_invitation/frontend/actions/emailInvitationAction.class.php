<?php


class employers_invitation_emailInvitationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->invitation=$this->getParameter('invitation')->getFormatter()->toArrayForEmail();
        $this->company=$this->getParameter('company')->toArray();                     
        $this->model_i18n= $this->getParameter('model_i18n'); 
        EmailVariablesModel::getVariables($this);
    }
    
 
   
}


