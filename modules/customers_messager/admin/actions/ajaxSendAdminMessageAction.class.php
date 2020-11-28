<?php

require_once __DIR__."/../locales/Forms/CustomerMessageNewForm.class.php";

class customers_messager_ajaxSendAdminMessageAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                   
        $messages= mfMessages::getInstance();     
        $this->form=new  CustomerMessageNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('CustomerMessage'));
        $this->form->bind($request->getPostParameter('CustomerMessage'));
        if ($this->form->isValid())
        {         
            $this->form->getMessage()->send();
            
            $messages->addInfo(__('Message has been sent.'));
            
             $engine= new CustomerAdminMessageEmailEngine($this->form->getMessage());
             $engine->send();
             
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


