<?php

class tests_testMailerAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();        
        try
        {             
              $this->getMailer()->sendMail('tests','emailTest','no-reply@ewebsolutions.fr','admin@ewebsolutions.fr','subject',$this);
        } 
        catch (Exception $e) {
           $messages->addError($e);
        }
        echo "Error:="; var_dump($messages->getDecodedMessages());
        return mfView::NONE;
    }

}
