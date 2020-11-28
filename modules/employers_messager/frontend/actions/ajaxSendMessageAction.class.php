<?php

require_once __DIR__."/../locales/Forms/CustomerEmployerMessageNewForm.class.php";

class employers_messager_ajaxSendMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();     
        $this->form=new  CustomerEmployerMessageNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerEmployerMessage'));
        $this->form->bind($request->getPostParameter('CustomerEmployerMessage'));
        if ($this->form->isValid())
        {         
            $this->form->getMessage()->send();
            
            $engine= new CustomerEmployerMessageEmailEngine($this->form->getMessage());
            $engine->send();
            
            
            $messages->addInfo(__('Message has been sent.'));
            $this->forward($this->getModuleName(), 'ajaxListPartialMessage');
        } 
        else
        {
           //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $this->getController()->setRenderMode(mfView::RENDER_JSON);                           
           return array('action'=>'SendMessage','errors'=>$this->form->getErrorSchema()->getErrorsMessage());  
        }          
    }
    
   
}


