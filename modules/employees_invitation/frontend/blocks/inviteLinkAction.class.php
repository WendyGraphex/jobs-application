<?php

class employees_invitation_inviteLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {        
      $this->user=$this->getUser();
      $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
