<?php

class employees_messager_messagesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->messages = CustomerEmployeeMessage::getUnreadMessages($this->getUser()->getGuardUser());
       if ($this->messages->isEmpty())
           return mfView::NONE;
    } 
    
    
}