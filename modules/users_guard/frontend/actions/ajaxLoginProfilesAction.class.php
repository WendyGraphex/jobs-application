<?php

require_once __DIR__."/../locales/Forms/LoginProfilesForm.class.php";

class users_guard_ajaxLoginProfilesAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->form = new LoginProfilesForm($request->getPostParameter('LoginProfiles'));      
        try 
        {                        
                $this->form->bind($request->getPostParameter('LoginProfiles'));
                if ($this->form->isValid()) 
                {
                // var_dump($this->form->isProfilUnique(),$this->form->getUser());   
                   if ($this->form->isProfilUnique())                
                        $this->user->signin($this->form->getUser(),$request->getIP(),$this->form['remember']->getValue());                                         
                   else               
                        $this->user->setProfiles($this->form->getProfiles());                                               
                }                                                
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }            
    }
    
   
}


