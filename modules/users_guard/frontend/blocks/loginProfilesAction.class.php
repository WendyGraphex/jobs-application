<?php

require_once __DIR__."/../locales/Forms/LoginProfilesForm.class.php";

class users_guard_loginProfilesActionComponent extends mfActionComponent {
            
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();              
        $this->form = new LoginProfilesForm(); 
        
          
    } 
    
    
}
