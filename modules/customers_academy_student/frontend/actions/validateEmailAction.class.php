<?php

class customers_academy_student_validateEmailAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();                
        $this->token=new EmployerUserValidationToken($request->getGetParameters());
        if ($this->token->isNotLoaded())
            $this->forward($this->getModuleName(), 'validateEmailError');       
        $this->getUser()->getStorage()->write('user',$this->token->getUser());          
        $this->token->validate();   // comments for debug         
        $this->getUser()->signin($this->token->getUser(),$request->getIP());
        $request->addRequestParameter('validate',true);
        $this->forward($this->getModuleName(), 'account');       
    }
    
}


