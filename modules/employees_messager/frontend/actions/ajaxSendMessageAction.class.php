<?php

require_once __DIR__."/../locales/Forms/CustomerEmployeeMessageNewForm.class.php";

class employees_messager_ajaxSendMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();     
        $this->form=new  CustomerEmployeeMessageNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerEmployeeMessage'));
        $this->form->bind($request->getPostParameter('CustomerEmployeeMessage'));
        if ($this->form->isValid())
        {         
            $this->form->getMessage()->send();
            
            $engine= new CustomerEmployeeMessageEmailEngine($this->form->getMessage());
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


