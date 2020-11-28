<?php

require_once __DIR__."/../locales/Forms/CreateProfileForm.class.php";

class users_guard_createProfileActionComponent extends mfActionComponent {
            
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();  
        if ($this->getUser()->hasProfiles())            
            return mfView::NONE;           
        if ($this->getUser()->isAuthenticated())            
            return mfView::NONE;   
        $this->form = new CreateProfileForm();
        $this->user=$this->getUser();                
    } 
    
    
}
