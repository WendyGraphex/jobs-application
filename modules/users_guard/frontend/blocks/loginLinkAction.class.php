<?php

class users_guard_loginLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
      $this->user=$this->getUser(); 
    } 
    
    
}
