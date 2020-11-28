<?php

class employers_messager_messagesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->messages = CustomerEmployerMessage::getUnreadMessages($this->getUser()->getGuardUser());
        if ($this->messages->isEmpty())
           return mfView::NONE;
    } 
    
    
}