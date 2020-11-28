<?php


class system_emailer_ajaxSendEmailByDefaultAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();        
        try
        {                 
                           
             // $this->getMailer()->debug();
              $this->getMailer()->sendMail('system_emailer','emailTest','no-reply@ewebsolutions.fr','admin@ewebsolutions.fr',__('Test email'),$this);
              $response=array('info'=>__('Email has been sent to admin@ewebsolutions.fr'));
        } 
        catch (Exception $e) {
           $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;      
    }

}
