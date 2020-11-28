<?php

class site_ajaxSendEmailAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();        
        try
        {     
             // $this->getMailer()->debug();
              $this->getMailer()->sendMail('site','emailTest','no-reply@ewebsolutions.fr','admin@ewebsolutions.fr',__('test email'),$this);
              $response=array('info'=>__('Email has been sent to admin@ewebsolutions.fr'));
        } 
        catch (Exception $e) {
           $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;      
    }

}
