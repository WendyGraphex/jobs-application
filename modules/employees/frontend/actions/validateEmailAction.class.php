<?php

class employees_validateEmailAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();                    
        $this->token=new EmployeeValidationToken($request->getGetParameters());
        if ($this->token->isNotLoaded())
            $this->forward($this->getModuleName(), 'validateEmailError');     
        $this->getUser()->getStorage()->write('employee',$this->token->getUser());          
        $this->token->validate();   // comments for debug
        $this->getUser()->signin($this->token->getUser(),$request->getIP());    
        $request->addRequestParameter('validate',true);
        $this->forward($this->getModuleName(), 'account');       
    }
    
}


